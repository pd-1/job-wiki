class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :chats
         has_many :messages
         has_one_attached :image
         with_options presence: true do
          validates :name
          validates :category_id, numericality: { other_than: 1 }
         end 
end
