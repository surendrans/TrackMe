class CreateWaypoints < ActiveRecord::Migration
  def self.up
    create_table :waypoints do |t|
      t.string :location
      t.string :latitude
      t.string :longitude
      t.time :client_time
      t.references :trip

      t.timestamps
    end
  end

  def self.down
    drop_table :waypoints
  end
end
