class Job < ApplicationRecord
  with_options presence: true do
    validates    :name  
    validates    :content
  end
  belongs_to :user

end
