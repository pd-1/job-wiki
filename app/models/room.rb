class Room < ApplicationRecord
  has_many :chats, dependent: :destroy
  has_many :messages, dependent: :destroy
end
