require 'rails_helper'

RSpec.describe Deli, type: :model do
  before do
    @deli = FactoryBot.build(:deli)
  end

  context '内容に問題ない場合' do
    it "tokenがあれば保存ができること" do
      expect(@deli).to be_valid
    end
  end
  context '内容に問題がある場合' do
  
    it "tokenが空では登録できないこと" do
      # @deli.token = nil
      # @deli.valid?
      # expect(@deli.errors.full_messages).to include("Token can't be blank")
    end
  end
end