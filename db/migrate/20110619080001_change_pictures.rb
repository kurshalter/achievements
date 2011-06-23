class ChangePictures < ActiveRecord::Migration
 def self.up
   rename_column(:pictures, :galerie, :galerie_name)

 end
end

