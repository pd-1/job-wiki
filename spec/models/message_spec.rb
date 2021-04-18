require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end
  describe 'メッセージの送信' do
    it '全ての値が正しく入力されていれば保存できること' do
      expect(@message).to be_valid
    end
    it'メッセージの中身がないと送信できないこと' do
      @message.content =''
      @message.valid?
      expect(@message.errors.full_messages).to include("Contentを入力してください")
    end
  end
end