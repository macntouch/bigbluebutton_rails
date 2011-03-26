class CreateBigbluebuttonRails < ActiveRecord::Migration

  def self.up
    create_table :bigbluebutton_servers do |t|
      t.string :name
      t.string :url
      t.string :salt
      t.string :version
      t.timestamps
    end
    create_table :bigbluebutton_rooms do |t|
      t.integer :server_id
      t.string :meeting_id
      t.string :meeting_name
      t.string :attendee_password
      t.string :moderator_password
      t.string :welcome_msg
      t.timestamps
    end
    add_index :bigbluebutton_rooms, :server_id
    add_index :bigbluebutton_rooms, :meeting_id, :unique => true
  end

  def self.down
    drop_table :bigbluebutton_rooms
    drop_table :bigbluebutton_servers
  end

end