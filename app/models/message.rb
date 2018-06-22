class Message < ApplicationRecord

  belongs_to :user
  belongs_to :room_chat

  validates :user_id, presence: true
  validates :room_chat_id, presence: true
  validates :content, presence: true, length: { maximum: 500 }
end
