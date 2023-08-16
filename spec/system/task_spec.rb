require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do

  before do
    FactoryBot.create(:task)
    FactoryBot.create(:second_task)
  end

  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        visit new_task_path
        fill_in "タスク", with: 'New Task'
        fill_in "内容", with: 'New Task'
        click_on 'タスクを保存'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content 'New Task'
      end
    end
  end

  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        visit tasks_path
        expect(page).to have_content 'task'
      end
    end
  end

  context 'タスクが作成日時の降順に並んでいる場合' do
    let!(:task3) { FactoryBot.create(:third_task)}
    it '新しいタスクが一番上に表示される' do
      visit tasks_path
      tasks = all('tbody tr')
      tasks_text = tasks.first.text
      expect(tasks_text).to include(task3.title)
    end
  end

  describe '詳細表示機能' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示される' do
        visit tasks_path
        all('tbody tr')[1].click_link '詳細'
        # click_link '詳細を見る'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content '内容'
       end
     end
  end
end