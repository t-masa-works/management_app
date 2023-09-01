FactoryBot.define do
  # 作成するテストデータの名前を「task」とします
  # （実際に存在するクラス名と一致するテストデータの名前をつければ、そのクラスのテストデータを自動で作成します）
  factory :task do
    title { 'task' }
    content { 'test_content' }
    end_time { '002023-08-01T00:00'}
    status { :not_started }
    priority { :low }

  end
  # 作成するテストデータの名前を「second_task」とします
  # （存在しないクラス名の名前をつける場合、オプションで「このクラスのテストデータにしてください」と指定します）
  factory :second_task, class: Task do
    title { 'task2' }
    content { 'test_content2' }
    end_time { '002023-8-15T00:00'}
    status { :completed }
    priority { :medium }
  end

  factory :third_task, class: Task do
    title { 'task3' }
    content { 'test_content3' }
    end_time { '002023-08-30T00:00'}
    status { :not_started }
    priority { :high }
  end

  factory :fourth_task, class: Task do
    title { 'task4' }
    content { 'test_content4' }
    end_time { '002023-09-30T00:00'}
    status { :completed }
    priority { :high }
    end

  factory :one_task, class: Task do
    title { 'task1' }
    content { 'test_content1' }
    end_time { '002023-01-30T00:00'}
    status { :not_started }
    priority { :high }
  end

  factory :two_task, class: Task do
    title { 'task2' }
    content { 'test_content2' }
    end_time { '002023-02-30T00:00'}
    status { :completed }
    priority { :low }
    end

  factory :three_task, class: Task do
    title { 'task3' }
    content { 'test_content3' }
    end_time { '002023-03-30T00:00'}
    status { :not_started }
    priority { :high }
  end

  factory :four_task, class: Task do
    title { 'task4' }
    content { 'test_content4' }
    end_time { '002023-04-30T00:00'}
    status { :completed }
    priority { :high }
    end

  factory :five_task, class: Task do
    title { 'task5' }
    content { 'test_content5' }
    end_time { '002023-05-30T00:00'}
    status { :not_started }
    priority { :medium }
  end

  factory :six_task, class: Task do
    title { 'task6' }
    content { 'test_content6' }
    end_time { '002023-06-30T00:00'}
    status { :completed }
    priority { :high }
    end

  factory :seven_task, class: Task do
    title { 'task7' }
    content { 'test_content7' }
    end_time { '002023-07-30T00:00'}
    status { :not_started }
    priority { :low }
  end

  factory :eight_task, class: Task do
    title { 'task8' }
    content { 'test_content8' }
    end_time { '002023-08-30T00:00'}
    status { :completed }
    priority { :medium }
    end

  factory :nine_task, class: Task do
    title { 'task9' }
    content { 'test_content9' }
    end_time { '002023-09-30T00:00'}
    status { :not_started }
    priority { :low }
  end

  factory :ten_task, class: Task do
    title { 'task10' }
    content { 'test_content10' }
    end_time { '002023-10-30T00:00'}
    status { :completed }
    priority { :high }
    end
end
