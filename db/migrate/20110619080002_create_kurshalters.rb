class CreateKurshalters < ActiveRecord::Migration
  def self.up
    create_table :kurshalters do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :kurshalters
  end
end
