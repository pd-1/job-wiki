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
          validates :category_id
         end 

         def self.guest
          user = User.find_or_create_by!(email: 'guest@example.com') do |user|
            user.password = SecureRandom.urlsafe_base64
            user.name = "ゲスト"
            user.category_id = 17
          end
         end
end
