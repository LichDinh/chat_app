class CreateRoomChats < ActiveRecord::Migration[5.1]
  def change
    create_table :room_chats do |t|
      t.integer :room_id
      t.integer :user_id
      t.boolean :status

      t.timestamps
    end
    add_index :room_chats, :room_id
    add_index :room_chats, :user_id
    add_index :room_chats, [:room_id, :user_id], unique: true
  end
end
