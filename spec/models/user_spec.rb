require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録(ユーザー情報)' do
    context '新規登録できるとき' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@user).to be_valid
      end
      it 'パスワードは確認用と一致してかつ6文字以上の半角英数字であれば保存できること' do
        @user.password = 'aba123'
        @user.password_confirmation = 'aba123'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'ニックネームが必須であること' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nameを入力してください")
      end
      it 'emailが必須であること' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'メールアドレスは、@を含む必要があること' do
        @user.email = 'testsample'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it 'カテゴリーが必須であること' do
        @user.category_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Categoryを入力してください")
      end
      it 'passwordが必須であること' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'パスワードは、6文字以上での入力が必須であること' do
        @user.password = '11111'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it 'パスワードは、半角英数字混合での入力が必須であること' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'パスワードは、半角英数字混合での入力が必須であること' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'パスワードは、確認用を含めて2回入力すること' do
        @user.password = 'a111111'
        @user.password_confirmation= ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'パスワードとパスワード（確認用）は、値の一致が必須であること' do
        @user.password = 'a111111'
        @user.password_confirmation= 'a222222'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
    end
  end
end
