require 'rails_helper'

RSpec.describe 'ユーザーの新規登録機能', type: :system do
  before do
    FactoryBot.create(:user)
  end

  context 'サインアップページから新規登録した場合' do
    it '登録ユーザーが、詳細ページに表示される' do
      visit new_user_path
      fill_in "名前", with: 'moge'
      fill_in "Email", with: 'moge@exam.com'
      fill_in "Password", with: 'moge'
      fill_in "Password confirmation", with: 'moge'
      click_on 'Create my account'
      expect(page).to have_content 'moge'
    end
  end

  context 'ログインせずにタスク一覧へ飛ぼうとした場合' do
    it 'ログイン画面に遷移する' do
      visit tasks_path
      expect(page).to have_content 'ログイン'
    end
  end
end