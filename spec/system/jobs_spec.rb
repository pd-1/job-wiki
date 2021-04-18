require 'rails_helper'

RSpec.describe "Jobs", type: :system do
  before do
    @user = FactoryBot.build(:user)
    load Rails.root.join("db/seeds.rb")
  end
  context '職業のwikiを編集することができる' do 
    it '自分が所属する職業のみ編集ができる' do
      sign_up(@user)
      expect(page).to have_content('医師')
      click_on("医師")
      expect(page).to have_content('編集する')
      click_on("編集する")
      fill_in 'job[become]', with: '編集できます'
      expect (
        find('input[name=commit]').click)
      expect(page).to have_content('編集できます')
    end
  end
  context '職業のwikiを編集することができない' do 
    it '自分が所属する職業以外は編集ができない' do
      sign_up(@user)
      expect(page).to have_content('システムエンジニア')
      click_on("システムエンジニア")
      expect(page).to have_no_content('編集する')
    end
  end
end
