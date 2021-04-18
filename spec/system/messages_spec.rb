require 'rails_helper'

RSpec.describe "Messages", type: :system do
  before do
    @user = FactoryBot.build(:user)
    @anoter_user = FactoryBot.build(:user)
    load Rails.root.join("db/seeds.rb")
  end
  context 'ユーザー新規登録ができるとき' do 
    it '正しい情報を入力すればユーザー新規登録ができて職業詳細に移動する' do
      sign_up(@user)
      expect(page).to have_content('ログアウト')
      click_on('ログアウト')
      expect(page).to have_content('新規登録')
      visit new_user_registration_path
      fill_in 'user[name]', with: @anoter_user.name
      fill_in 'user[email]', with: @anoter_user.email
      select "医療系", from: "user[category_id]"
      sleep 0.5
      find("#child_category").select "看護師"
      fill_in 'user[password]', with: @anoter_user.password
      fill_in 'user[password_confirmation]', with: @anoter_user.password_confirmation
      expect {
        find('input[name=commit]').click
      }.to change { User.count }.by(1)
      expect(current_path).to eq(jobs_path) 
      expect(page).to have_content('医師')
      click_on("医師")
      expect(page).to have_content(@user.name)
      click_on(@user.name)
      expect {
        find('input[name=commit]').click
      }.to change { Room.count }.by(1)
      expect {
        fill_in 'message[content]', with: "メッセージが送信できています"
        click_button '投稿する'
        visit current_path
      }.to change(Message, :count).by(1)
      expect(page).to have_content("メッセージが送信できています")
    end
  end
end
