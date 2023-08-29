FactoryBot.define do

  factory :user do
    name { "first" }
    email { "first@exam.com" }
    password { '1' }
    password_confirmation { '1' }
    admin { true }
  end


  factory :second_user, class: User do
      name { "second" }
      email { "second@exam.com" }
      password { '2' }
      password_confirmation { '2' }
      admin { false }
  end

  factory :third_user, class: User do
    name { "third" }
    email { "third@exam.com" }
    password { '3' }
    password_confirmation { '3' }
    admin { false }
end
end