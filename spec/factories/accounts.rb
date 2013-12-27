FactoryGirl.define do
  sequence(:subdomain) { |n| "subdomain#{n}" }
  
  factory :account do
    sequence(:subdomain) { |n| "subdomain#{n}" }
    association :owner, factory: :user

    factory :account_with_schema do
      after(:build) do |account|
        Apartment::Database.create(account.subdomain)
        Apartment::Database.switch(account.subdomain)
      end
      after(:create) do |account|
        Apartment::Database.reset
      end
    end
  end
end
