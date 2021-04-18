FactoryBot.define do
  factory :user do
    name                  {Faker::Name.initials(number: 8)}
    email                 {Faker::Internet.free_email}
    password              {'test1234TEST'}
    password_confirmation {password}
    association :category
  end
end
