class User < ActiveRecord::Base
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => "email is invalid"
  validates :email, :presence => true, :uniqueness => true
  has_many :user_friends, dependent: :destroy
end
