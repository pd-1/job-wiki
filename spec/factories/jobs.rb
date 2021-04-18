FactoryBot.define do
  factory :job do
    description    {Faker::Lorem.sentence}
    active    {Faker::Lorem.sentence}
    flow     {Faker::Lorem.sentence}
    become    {Faker::Lorem.sentence}
    qualification    {Faker::Lorem.sentence}
    salary    {Faker::Lorem.sentence}
    rewarding    {Faker::Lorem.sentence}
    busy    {Faker::Lorem.sentence}
    correct    {Faker::Lorem.sentence}
    aspiring    {Faker::Lorem.sentence}
    status    {Faker::Lorem.sentence}
    demand    {Faker::Lorem.sentence}
    future    {Faker::Lorem.sentence}
    association :category
  end
end