require 'ftools'
require 'date'
require 'rubygems'
require 'exifr'
require 'RMagick'
require 'sqlite3'
require 'active_record'

#ActiveRecord::Base.logger = Logger.new(STDERR)
#ActiveRecord::Base.colorize_logging = false

ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database => "M:/achievements/db/achievement.sqlite3",
    :dbfile  => "M:/achievements/db/achievement.sqlite3"
)

class Picture < ActiveRecord::Base
    has_many :bilder
end

class Galerie < ActiveRecord::Base
end

puts "START ....."

main_path = "e:/bilder/"
web_path  = "m:/achievements/public/images/galerie/"
act_path  = ARGV.first

begin
ndir = Dir.new(web_path + act_path)
rescue SystemCallError
Dir.mkdir(web_path + act_path)
end


bilddir   = main_path + act_path 
#dateiname = bilddir + "/" + "Pic_Liste.csv"
dateiname = "Pic_Liste.csv"

Dir.chdir(bilddir)

datei = File.open( dateiname, "r" )

datei.each_line do | zeile |
   pname, ppfad, pcomment, pgalerie, pcountry, pdescription = zeile.chomp.split(/\s*\;\s*/)
   image_file = main_path + ppfad 
   dirname   = File.dirname(image_file)
   exif_info = nil
   image_file.downcase
   exif_info = EXIFR::JPEG.new(image_file)
   mag_info  = Magick::Image.read(image_file).first
   mag_info['comment'] = pcomment

#   puts mag_info.get_exif_by_entry('DateTime')[0][1]
   mydate = mag_info.get_exif_by_entry('DateTime')[0][1]
   mydate_obj = Date::strptime(mydate, '%Y:%m:%d %H:%M:%S')
#   puts mydate_obj
   
   if exif_info.width > exif_info.height
     h = 100
     w = (exif_info.width * 100)/exif_info.height
   elsif exif_info.width < exif_info.height
     w = 100
     h = (exif_info.width * 100)/exif_info.height
   else
     w = 100
     h = 100
   end

   if exif_info.width > exif_info.height
     h_big = 600
     w_big = (exif_info.width * 600)/exif_info.height
   elsif exif_info.width < exif_info.height
     w_big = 600
     h_big = (exif_info.width * 600)/exif_info.height
   else
     w_big = 600
     h_big = 600
   end



#puts w.to_s + " x " + h.to_s

picpath_db = dirname.gsub(main_path,'')
webpath_pic	= web_path + picpath_db + "/" + pname
webpath_thumb   = web_path + picpath_db + "/" + "thumbnails" + "/" + pname

   thumb = mag_info.resize(w,h)
   big   = mag_info.resize(w_big,h_big)


   gal = Galerie.find_by_galerie_name(pgalerie)
   
   if gal.nil? 
     Galerie.create(:galerie_name => pgalerie,
                    :date_galerie => mydate_obj,
                    :picthumb => thumb.to_blob)
     gal = Galerie.find_by_galerie_name(pgalerie)
   end

puts gal.galerie_name

   Picture.create(:filename => pname , 
                  :picpath  => picpath_db ,
                  :height   => exif_info.height, 
                  :width    => exif_info.width,
                  :model    => exif_info.model,
                  :comment  => pcomment,
                  :galerie_name  => pgalerie,
                  :galerie_id  => gal.id,
                  :country  => pcountry,
                  :description => pdescription,
                  :date_orig => mydate_obj,
                  :date_galerie => mydate_obj,
                  :picthumb => thumb.to_blob)


begin
ndir = Dir.new(File.dirname(webpath_pic))
rescue SystemCallError
Dir.mkdir File.dirname(webpath_pic)
end


begin
ndir = Dir.new(File.dirname(webpath_thumb))
rescue SystemCallError
Dir.mkdir File.dirname(webpath_thumb)
end


#   mag_info.write(webpath_pic)
   big.write(webpath_pic)
   thumb.write(webpath_thumb)


end
datei.close


puts "Ende der Verarbeitung"
