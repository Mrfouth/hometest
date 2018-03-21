class UserFriend < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => "User", :foreign_key => "friend_id"

  def self.create_relation emails
    user1 = User.where(email: emails[0]).first_or_create
    user2 = User.where(email: emails[1]).first_or_create
    UserFriend.where(user_id: user1.id, user_friend_id: user2.id).first_or_create
    UserFriend.where(user_id: user2.id, user_friend_id: user1.id).first_or_create
  end
end
