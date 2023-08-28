require 'rails_helper'

RSpec.describe 'ユーザー登録機能のテスト', type: :system do
  before do
    @user = FactoryBot.create(:user)
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

  describe 'セッション機能のテスト' do
    context 'セッションページからログインした場合' do
      let!(:user1) { FactoryBot.create(:second_user)}
      it "ログインができること" do
        visit new_session_path
        fill_in 'Email', with: 'second@exam.com'
        fill_in 'Password', with: '2'
        click_on 'Log in'
        expect(page).to have_content 'second'
      end
    end
    
    context 'ログインして、Profileへのリンクを押した場合' do
      let!(:user1) { FactoryBot.create(:second_user)}
      it "マイページへ飛べること" do
        visit new_session_path
        fill_in 'Email', with: 'second@exam.com'
        fill_in 'Password', with: '2'
        click_on 'Log in'
        click_link 'Profile'
        expect(page).to have_content 'second'
      end
    end
    
    context '一般ユーザーが他ユーザーの詳細へ行こうとした場合' do
      let!(:user3) {FactoryBot.create(:third_user)}
      let!(:user2) { FactoryBot.create(:second_user)}
      it "タスク一覧画面へ遷移すること" do
        visit new_session_path
        fill_in 'Email', with: 'second@exam.com'
        fill_in 'Password', with: '2'
        click_on 'Log in'
        visit user_path(user3)
        expect(page).to have_content 'タスク一覧'
      end
    end

    context 'ログイン後、ログアウトボタンを押した場合' do
      let!(:user1) { FactoryBot.create(:second_user)}
      it "ログアウトができること" do
        visit new_session_path
        fill_in 'Email', with: 'second@exam.com'
        fill_in 'Password', with: '2'
        click_on 'Log in'
        click_link 'Logout'
        expect(page).to have_content 'ログアウトしました'
      end
    end
  end

  describe '管理画面のテスト' do
    context '管理者が管理画面にアクセスした場合' do
      let!(:user1) { FactoryBot.create(:second_user)}
      it "管理画面に遷移できること" do
        visit new_session_path
        fill_in 'Email', with: 'first@exam.com'
        fill_in 'Password', with: '1'
        click_on 'Log in'
        visit admin_users_path(wait: 30)
        expect(page).to have_content 'ユーザー管理ページ'
      end
    end

    context '一般ユーザーが管理画面にアクセスした場合' do
      let!(:user1) { FactoryBot.create(:second_user)}
      it "管理画面に遷移できない" do
        visit new_session_path
        fill_in 'Email', with: 'second@exam.com'
        fill_in 'Password', with: '2'
        click_on 'Log in'
        visit admin_users_path(wait: 30)
        expect(page).to have_content '権限がありません'
      end
    end

    context '管理者がユーザーの詳細画面にアクセスした場合' do
      let!(:user1) { FactoryBot.create(:second_user)}
      it "ユーザーの詳細画面に遷移できること" do
        visit new_session_path
        fill_in 'Email', with: 'first@exam.com'
        fill_in 'Password', with: '1'
        click_on 'Log in'
        visit user_path(user1, wait: 30)
        expect(page).to have_content 'second@exam.com'
      end
    end

    context '管理者がユーザー編集画面にアクセスして' do
      let!(:user1) { FactoryBot.create(:second_user)}
      it "ユーザーを編集できること" do
        visit new_session_path
        fill_in 'Email', with: 'first@exam.com'
        fill_in 'Password', with: '1'
        click_on 'Log in'
        visit edit_admin_user_path(user1)
        fill_in "名前", with: 'moge'
        fill_in "Email", with: 'moge@exam.com'
        fill_in "Password", with: 'moge'
        fill_in "Password confirmation", with: 'moge'
        click_on "Create  account"
        expect(page).to have_content 'moge@exam.com'
      end
    end

    context '管理者がユーザーの削除ボタンを押した場合' do
      let!(:user1) { FactoryBot.create(:second_user)}
      it "ユーザーが削除できること" do
        visit new_session_path
        fill_in 'Email', with: 'first@exam.com'
        fill_in 'Password', with: '1'
        click_on 'Log in'
        visit edit_admin_user_path(user1, wait: 30)
        click_on '削除'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_no_content  "second@exam.com"
      end
    end
  end
end