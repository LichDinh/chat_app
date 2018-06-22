class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.integer :room_chat_id
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
