class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.text :name
      t.string :lattitude
      t.string :longitude
      t.time :client_time

      t.timestamps
    end
  end

  def self.down
    drop_table :locations
  end
end
