FactoryBot.define do
  factory :tag do
    tag_name { "会議" }
  end

  factory :second_tag, class: Tag do
    tag_name { "提出物" }
  end

  factory :third_tag, class: Tag do
    tag_name { "管理" }
  end


  factory :one_tag, class: Tag do
    tag_name { "提出物" }
  end

  factory :two_tag, class: Tag do
    tag_name { "資料作成" }
  end


  factory :three_tag, class: Tag do
    tag_name { "課題" }
  end

  factory :four_tag, class: Tag do
    tag_name { "研修" }
  end


  factory :five_tag, class: Tag do
    tag_name { "勉強会" }
  end


  factory :six_tag, class: Tag do
    tag_name { "会議" }
  end

  factory :seven_tag, class: Tag do
    tag_name { "委員会" }
  end

  factory :eight_tag, class: Tag do
    tag_name { "行事" }
  end

  factory :nine_tag, class: Tag do
    tag_name { "外出" }
  end

  factory :ten_tag, class: Tag do
    tag_name { "管理" }
  end
end
