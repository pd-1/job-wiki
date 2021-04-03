class Job < ApplicationRecord
  with_options presence: true do
    validates    :name
    validates    :genre_id 
    validates    :description
    validates    :active
    validates    :flow 
    validates    :become
    validates    :qualification
    validates    :salary
    validates    :rewarding
    validates    :busy
    validates    :correct
    validates    :aspiring
    validates    :status
    validates    :demand
    validates    :future
end
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :genre
end
