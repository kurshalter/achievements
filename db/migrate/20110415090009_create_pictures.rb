class CreatePictures < ActiveRecord::Migration
  def self.up
    create_table :pictures do |t|
      t.string :filename
      t.string :picpath
      t.integer :height
      t.integer :width
      t.string :comment
      t.datetime :date_orig
      t.datetime :date_galerie
      t.string :model
      t.string :title_long
      t.string :country
      t.integer :galerie_id
      t.string :galerie
      t.text :description
      t.string :GPSLatitudeRef
      t.string :GPSLatitude
      t.string :GPSLongitudeRef
      t.string :GPSLongitude
      t.integer :GPSAltitudeRef
      t.integer :GPSAltitude
      t.binary :picthumb

      t.timestamps
    end
   end

  def self.down
    drop_table :pictures
  end
  
end
