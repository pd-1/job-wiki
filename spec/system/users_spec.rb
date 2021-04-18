require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
    load Rails.root.join("db/seeds.rb")
  end
  context 'ユーザー新規登録ができるとき' do 
    it '正しい情報を入力すればユーザー新規登録ができて職業詳細に移動する' do
      visit root_path
      expect(page).to have_content('新規登録')
      visit new_user_registration_path
      fill_in 'user[name]', with: @user.name
      fill_in 'user[email]', with: @user.email
      select "医療系", from: "user[category_id]"
      sleep 0.5
      find("#child_category").select "医師"
      fill_in 'user[password]', with: @user.password
      fill_in 'user[password_confirmation]', with: @user.password_confirmation
      expect {
        find('input[name=commit]').click
      }.to change { User.count }.by(1)
      expect(current_path).to eq(jobs_path) 
      expect(page).to have_content('ログアウト')
      expect(page).to have_no_content('新規登録')
    end
    it '簡単ログインをクリックしたらユーザー新規登録ができて職業詳細に移動する' do
      visit root_path
      expect(page).to have_content('ゲストログイン(閲覧用)')
      click_on('ゲストログイン(閲覧用)')
      visit jobs_path 
    end
  end
  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      visit root_path
      expect(page).to have_content('新規登録')
      visit new_user_registration_path
      fill_in 'user[name]', with: ''
      fill_in 'user[email]', with: ''
      fill_in 'user[password]', with: ''
      expect {
        find('input[name=commit]').click
      }.to change { User.count }.by(0)
      expect(current_path).to eq user_registration_path
    end
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      visit root_path
      expect(page).to have_content('新規登録')
      visit new_user_registration_path
      fill_in 'user[name]', with: @user.name
      fill_in 'user[email]', with: @user.email
      select "医療系", from: "user[category_id]"
      sleep 0.5
      fill_in 'user[password]', with: @user.password
      fill_in 'user[password_confirmation]', with: @user.password_confirmation
      expect {
        find('input[name=commit]').click
      }.to change { User.count }.by(0)
      expect(current_path).to eq user_registration_path
    end
  end
end

RSpec.describe 'ログイン', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'ログインができるとき' do
    it '保存されているユーザーの情報と合致すればログインができる' do
      visit root_path
      expect(page).to have_content('ログイン')
      visit new_user_session_path
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(jobs_path)
      expect(page).to have_content('ログアウト')
      expect(page).to have_no_content('新規登録')
    end
    it '保存されているユーザーの情報と合致しないとログインができない' do
      visit root_path
      expect(page).to have_content('ログイン')
      visit new_user_session_path
      fill_in 'user[email]', with: ''
      fill_in 'user[password]', with: ''
      find('input[name="commit"]').click
      expect(current_path).to eq(new_user_session_path)
    end
  end
end