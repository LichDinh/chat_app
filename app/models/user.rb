class User < ApplicationRecord

  acts_as_token_authenticatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable

  has_many :room_chats
  has_many :room, through: :room_chats, class_name: 'Room'

  validates :username, presence: true, uniqueness: true, length: { maximum: 15 }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 5 }

  def self.find_user_email_or_username(login)
   User.find_by(email: login) || User.find_by(username: login)
  end

end
