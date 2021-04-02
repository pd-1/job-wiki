class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :chats
         has_many :messages
         has_many :jobs
         has_one_attached :image
         with_options presence: true do
          validates :name
          validates :genre_id, numericality: { other_than: 1 }
         end 
         extend ActiveHash::Associations::ActiveRecordExtensions
         belongs_to_active_hash :genre
end
