FactoryBot.define do
  factory :tag do
    tag_name { "会議" }
  end

  factory :second_tag, class: Tag do
    tag_name { "提出物" }
  end

  factory :third_tag, class: Tag do
    tag_name { "管理"}
  end
end
