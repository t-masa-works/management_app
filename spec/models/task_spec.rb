require 'rails_helper'

RSpec.describe Task, type: :model do

  describe 'バリデーションのテスト' do
    context 'タスクのタイトルが空の場合' do
      it 'バリデーションにひっかかる' do
        task = Task.new(title: '', content: '失敗テスト', end_time:'002023-08-01T00:00', status: :not_started )
        expect(task).not_to be_valid
      end
    end

    context 'タスクの詳細が空の場合' do
      it 'バリデーションにひっかかる' do
        task = Task.new(title: '失敗テスト', content: '')
        expect(task).not_to be_valid
      end
    end

    context 'タスクのタイトルと詳細に内容が記載されている場合' do
      it 'バリデーションが通る' do
        task = Task.new(title: '成功テスト', content: '成功テスト', end_time:'002023-08-01T00:00', status: :not_started )
        expect(task).to be_valid
      end
    end
  end

  describe 'タスクモデル機能', type: :model do
    describe '検索機能' do
      # 必要に応じて、テストデータの内容を変更して構わない
      let!(:task) { FactoryBot.create(:task, title: 'task', content: 'テスト', end_time:'002023-08-01T00:00', status: :not_started) }
      let!(:second_task) { FactoryBot.create(:second_task, title: "sample", content: 'テスト', end_time:'002023-08-01T00:00', status: :completed) }
      context 'scopeメソッドでタイトルのあいまい検索をした場合' do
        it "検索キーワードを含むタスクが絞り込まれる" do
          # title_seachはscopeで提示したタイトル検索用メソッドである。メソッド名は任意で構わない。
          expect(Task.with_title('task')).to include(task)
          expect(Task.with_title('task')).not_to include(second_task)
          expect(Task.with_title('task').count).to eq 1
        end
      end
      context 'scopeメソッドでステータス検索をした場合' do
        it "ステータスに完全一致するタスクが絞り込まれる" do
          expect(Task.with_status(:not_started)).to include(task)
          expect(Task.with_status(:not_started)).not_to include(second_task)
          expect(Task.with_status(:not_started).count).to eq 1
        end
      end
      context 'scopeメソッドでタイトルのあいまい検索とステータス検索をした場合' do
        it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
          expect(Task.task_and_status('task',:not_started)).to include(task)
          expect(Task.task_and_status('task',:not_started)).not_to include(second_task)
          expect(Task.task_and_status('task',:not_started).count).to eq 1
        end
      end
    end
  end
end
