class CreateUserRequestDetails < ActiveRecord::Migration
  def self.up
    create_table :user_request_details do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.boolean :status
      t.datetime :request_sent_on
      t.datetime :request_confirmed_on

      t.timestamps
    end
  end

  def self.down
    drop_table :user_request_details
  end
end
