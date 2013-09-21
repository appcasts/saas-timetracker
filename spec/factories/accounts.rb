# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :account do
    subdomain "MyString"
    owner_id 1
  end
end
