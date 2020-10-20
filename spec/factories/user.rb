FactoryBot.define do

  factory :user do
    name             { 'User Name' }
    sequence(email)  { |n| "mail#{n}@mail.com" }
    password         { 'password' }
    admin            { false }

    factory :admin do
      admin          { true }
    end

  end

end