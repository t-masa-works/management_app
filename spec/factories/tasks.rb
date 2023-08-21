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

    factory :third_task, class: Task do
      title { 'task3' }
      content { 'test_content3' }
      end_time { '002023-08-30T00:00'}
      status { :not_started }

    factory :fourth_task, class: Task do
      title { 'task4' }
      content { 'test_content4' }
      end_time { '002023-09-30T00:00'}
      status { :completed }
      priority { :high }
      end

    end
  end
end
