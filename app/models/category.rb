class Category < ApplicationRecord
  has_ancestry
  has_many :users
  has_many :jobs
end
