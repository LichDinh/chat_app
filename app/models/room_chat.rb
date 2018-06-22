class RoomChat < ApplicationRecord

  belongs_to :room
  belongs_to :user

  scope :_status, ->(status) { where(status: status) }
end
