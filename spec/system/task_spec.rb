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
        fill_in "終了期限", with: '002023-09-01T00:00'
        select '完了', from:'ステータス'
        click_on 'タスクを保存'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content '完了'
      end
    end
  end

  describe '検索機能' do
    context 'タイトルであいまい検索をした場合' do
      it "検索キーワードを含むタスクで絞り込まれる" do
        visit tasks_path
        # タスクの検索欄に検索ワードを入力する (例: task)
        fill_in 'search_input', with: 'task'
        click_button 'Search'
        expect(page).to have_content 'task'
      end
    end

    context 'ステータス検索をした場合' do
      it "ステータスに完全一致するタスクが絞り込まれる" do
        # ここに実装する
        visit tasks_path
        select '完了', from:'task_status'
        # find("option[value='completed']").select_option
        # プルダウンを選択する「select」について調べてみること
        click_button 'Search'
        expect(page).to have_content '完了'
      end
    end
    
    context 'タイトルのあいまい検索とステータス検索をした場合' do
      it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
        visit tasks_path
        fill_in 'search_input', with: 'task'
        find("option[value='completed']").select_option
        click_button 'Search'
        expect(page).to have_content '完了'
        expect(page).to have_content 'task'
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

  context '終了期限の降順でソートした場合' do
    let!(:task4) { FactoryBot.create(:fourth_task)}
    it '終了期限が一番遅いタスクが一番上に表示される' do
      visit tasks_path
      click_link '終了期限でソート'
      tasks = all('tbody tr', wait: 30)
      tasks_text = tasks.first.text
      expect(tasks_text).to include(task4.title)
    end
  end

  context '優先度の降順でソートした場合' do
    let!(:task4) { FactoryBot.create(:fourth_task)}
    it '優先度が一番高いタスクが一番上に表示される' do
      visit tasks_path
      click_link '優先順位でソート'
      tasks = all('tbody tr', wait: 30)
      tasks_text = tasks.first.text
      expect(tasks_text).to have_content '高'
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