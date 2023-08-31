require 'rails_helper'

RSpec.describe "TagSpec.rbs", type: :system do
  let!(:tag1) { FactoryBot.create(:tag) }
  let!(:tag2) { FactoryBot.create(:second_tag) }
  let!(:tag3) { FactoryBot.create(:third_tag)}
  let!(:user) { FactoryBot.create(:user) }
  let!(:task1) { FactoryBot.create(:task, user: user, tags:[tag3]) }
  let!(:task2) { FactoryBot.create(:second_task, user: user)}
  let!(:task3) { FactoryBot.create(:third_task, user: user)}

  before do
    visit new_session_path
    fill_in 'Email', with: 'first@exam.com'
    fill_in 'Password', with: '1'
    click_on 'Log in'
  end

  describe 'タグの付け外し機能' do
    context 'タスクを新規作成し、タグにチェックをつけた場合' do
      it '作成したタスクにタグが付与される' do
        visit new_task_path
        fill_in "タスク", with: 'New Task'
        fill_in "内容", with: 'New Task'
        fill_in "終了期限", with: '002023-09-01T00:00'
        select '完了', from:'ステータス'
        check '会議'
        click_on 'タスクを保存'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content '会議'
      end
    end

    context 'すでに付与されたタグのチェックを編集で外した場合' do
      it 'チェックを外したタスクが外れる' do
        visit user_path(user)
        task = Task.find_by(title: 'task')
        expect(page).to have_link '編集', href: edit_task_path(task)
        click_link '編集', href: edit_task_path(task)
        page.driver.browser.switch_to.alert.accept
        uncheck '管理'
        click_on 'タスクを保存'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content '管理'
      end
    end

  describe '検索機能' do
    context 'タグ検索をした場合' do
      it "タグに完全一致するタスクが絞り込まれる" do
        visit tasks_path
        select "提出物", from: "task_tag_id"
        # find("option[value='提出物']").select_option
        click_button 'Search'
        expect(page).to have_content '提出物'
      end
    end
  end
  end
end
