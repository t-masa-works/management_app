FactoryBot.define do

  factory :user do
    name { "tobe" }
    email { "tobe@gmail.com" }
    password { 'masa'}
    password_confirmation { 'masa'}
    admin { true }
  end


  factory :second_user, class: User do
      name { "1" }
      email { "1@exam.com" }
      password { '1'}
      password_confirmation { '1'}
      admin { false }
  end
end