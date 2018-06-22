class AddUsernameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string, limit: 15
    add_index :users, :username, unique: true
  end
end
