class Message < ApplicationRecord

  has_many :user_messages
  has_many :users, through: :room_users
  with_options presence: true do
    validates    :content
  end
end
