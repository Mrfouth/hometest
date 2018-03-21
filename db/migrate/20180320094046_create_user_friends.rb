class CreateUserFriends < ActiveRecord::Migration[5.1]
  def change
    create_table :user_friends, :id=>false do |t|
      t.integer :user_id
      t.integer :user_friend_id
    end
    add_index :user_friends, :user_id
    add_index :user_friends, :user_friend_id
  end
end
