require 'rails_helper'

RSpec.describe Pay, type: :model do
  before do
    @pay = FactoryBot.build(:pay)
  end

  context '内容に問題ない場合' do
    it "priceがあれば保存ができること" do
     
      expect(@pay).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "priceが空では保存ができないこと" do
      @pay.price = nil
      @pay.valid?
      expect(@pay.errors.full_messages).to include("Price can't be blank")
    end
  end
end
