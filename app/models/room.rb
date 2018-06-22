class Room < ApplicationRecord

  has_many :room_chats
  has_many :users, through: :room_chats, class_name: 'User'

  validates :name, presence: true, uniqueness: true, length: { maximum: 15 }
end
