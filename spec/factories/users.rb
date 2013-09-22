FactoryGirl.define do
  factory :user do
    name 'Ryan'
    sequence(:email) { |n| "email#{n}@gmail.com" }
    password 'pw'
  end
end
