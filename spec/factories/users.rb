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

  factory :one_user, class: User do
    name { "one" }
    email { "one@exam.com" }
    password { 'one' }
    password_confirmation { 'one' }
    admin { true }
  end

  factory :two_user, class: User do
    name { "two" }
    email { "two@exam.com" }
    password { 'two' }
    password_confirmation { 'two' }
    admin { false }
  end

  factory :three_user, class: User do
    name { "three" }
    email { "three@exam.com" }
    password { 'three' }
    password_confirmation { 'three' }
    admin { false }
  end

  factory :four_user, class: User do
    name { "four" }
    email { "four@exam.com" }
    password { 'four' }
    password_confirmation { 'four' }
    admin { false }
  end

  factory :five_user, class: User do
    name { "five" }
    email { "five@exam.com" }
    password { 'five' }
    password_confirmation { 'five' }
    admin { false }
  end

  factory :six_user, class: User do
    name { "six" }
    email { "six@exam.com" }
    password { 'six' }
    password_confirmation { 'six' }
    admin { false }
  end

  factory :seven_user, class: User do
    name { "seven" }
    email { "seven@exam.com" }
    password { 'seven' }
    password_confirmation { 'seven' }
    admin { false }
  end

  factory :eight_user, class: User do
    name { "eight" }
    email { "eight@exam.com" }
    password { 'eight' }
    password_confirmation { 'eight' }
    admin { false }
  end

  factory :nine_user, class: User do
    name { "nine" }
    email { "nine@exam.com" }
    password { 'nine' }
    password_confirmation { 'nine' }
    admin { false }
  end

  factory :ten_user, class: User do
    name { "ten" }
    email { "ten@exam.com" }
    password { 'ten' }
    password_confirmation { 'ten' }
    admin { false }
  end
end