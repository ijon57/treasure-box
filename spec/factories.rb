FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@mail.test" }
    password "123TestPassword"
  end

  factory :treasure do
    user
    sequence(:name) {|n| "treasure #{n}" }
  end
end