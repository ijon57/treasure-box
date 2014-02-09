FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@mail.test" }
  end
end