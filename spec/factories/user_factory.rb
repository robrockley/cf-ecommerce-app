FactoryGirl.define do
  sequence(:email) { |n| "user#{n}@testing.com" }
  factory :user do
    email
    password "1234567890"
    first_name "Rob"
    last_name "Testing"
    admin false
  end

  factory :admin, class: User do
    email
    password "asdfqwerzxcv"
    first_name "Admin"
    last_name "User"
    admin true
  end

end