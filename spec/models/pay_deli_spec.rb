require 'rails_helper'

RSpec.describe PayDeli, type: :model do
  describe '決済情報の保存' do
    before do
      @pay_deli = FactoryBot.build(:pay_deli)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@pay_deli).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @pay_deli.building = ""
      end
    end

    context '内容に問題がある場合' do
      it ' postcodeが空だと保存できないこと' do
        @pay_deli.postcode = ""
        @pay_deli.valid?
        expect(@pay_deli.errors.full_messages).to include("Postcode can't be blank")
      end

      it ' postcodeは-がないと保存できないこと' do
        @pay_deli.postcode = "1234567"
        @pay_deli.valid?
      expect(@pay_deli.errors.full_messages).to include("Postcode is not a valid format")
      end

      it ' postcodeは7文字でないと保存できないこと' do
        @pay_deli.postcode = "123-456"
        @pay_deli.valid?
        expect(@pay_deli.errors.full_messages).to include("Postcode is not a valid format")
        end

      it 'prefecture_idが空だと保存できないこと' do
        @pay_deli.prefecture_id = ""
        @pay_deli.valid?
        expect(@pay_deli.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idを選択していないと保存できないこと' do
        @pay_deli.prefecture_id = 1
        @pay_deli.valid?
        expect(@pay_deli.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空だと保存できないこと' do
        @pay_deli.city = ""
        @pay_deli.valid?
        expect(@pay_deli.errors.full_messages).to include("City can't be blank")
      end
    
      it 'phone_numberが空だと保存できないこと' do
        @pay_deli.phone_number = ""
        @pay_deli.valid?
        expect(@pay_deli.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが10文字、11文字でないと保存できないこと' do
        @pay_deli.phone_number = "123456789"
        @pay_deli.valid?
        expect(@pay_deli.errors.full_messages).to include("Phone number Postcode is not a valid format")
      end
      it 'tekenが空だと保存できないこと' do
        @pay_deli.token= nil
        @pay_deli.valid?
        expect(@pay_deli.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end