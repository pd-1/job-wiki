class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :chats
         has_many :messages
         belongs_to :category
         has_one_attached :image
         with_options presence: true do
          validates :name
<<<<<<< Updated upstream
          validates :genre_id, numericality: { other_than: 1 }
=======
          validates :category_id
>>>>>>> Stashed changes
         end 
         extend ActiveHash::Associations::ActiveRecordExtensions
         belongs_to_active_hash :genre
end
