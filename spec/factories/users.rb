FactoryGirl.define do
  factory :user do
    email "test@test.com"
    password_digest "super secret"
  end
end
