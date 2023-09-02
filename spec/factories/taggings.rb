FactoryBot.define do
  factory :tagging do
    association :task
    association :tag
  end
end
