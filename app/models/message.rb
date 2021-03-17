class Message < ApplicationRecord

  has_many :user_messages
  has_many :users, through: :room_users
end
