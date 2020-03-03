FactoryBot.define do
  factory :user do
    email { 'test@test.com' }
    login { 'test' }
    password { '12345678' }
  end
end
