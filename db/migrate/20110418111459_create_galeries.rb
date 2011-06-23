class CreateGaleries < ActiveRecord::Migration
  def self.up
    create_table :galeries do |t|
      t.string :galerie
      t.string :short_desc
      t.datetime :date_galerie
      t.binary :picthumb

      t.timestamps
    end
  end

  def self.down
    drop_table :galeries
  end
end
