class ChangeGaleries < ActiveRecord::Migration
 def self.up
   rename_column(:galeries, :galerie, :galerie_name)

 end
end