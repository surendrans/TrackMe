class CreateTrips < ActiveRecord::Migration
  def self.up
    create_table :trips do |t|
      t.string :name
      t.string :starting
      t.string :start_latlong
      t.string :destination
      t.string :destination_latlong
      t.boolean :finished
      t.boolean :started

      t.timestamps
    end
  end

  def self.down
    drop_table :trips
  end
end
