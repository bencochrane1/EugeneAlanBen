FactoryGirl.define do
  factory :user do
    name 'Ben'
    sequence(:email) { |n| "email#{n}@gmail.com" }
    password 'pw'
  end

end
