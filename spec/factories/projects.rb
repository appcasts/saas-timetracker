FactoryGirl.define do
  factory :project do
    sequence(:name) { |n| "My Project #{n}" }
    client "My Client"
    archived false
  end
end
