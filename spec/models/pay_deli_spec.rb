require 'rails_helper'

RSpec.describe PayDeli, type: :model do
  describe '決済情報の保存' do
    before do
      user = FactoryBot.create(:user)
      @pay_deli = PayDeli.new( user_id: user.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        user = FactoryBot.create(:user)
        item = FactoryBot.create(:item)
        @pay_deli = FactoryBot.build(:pay_deli, user_id: user.id, item_id: item.id)
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
      it 'blockが空だと保存できないこと' do
        @pay_deli.block = ""
        @pay_deli.valid?
        expect(@pay_deli.errors.full_messages).to include("Block can't be blank")
      end
    
      it 'phone_numberが空だと保存できないこと' do
        @pay_deli.phone_number = ""
        @pay_deli.valid?
        expect(@pay_deli.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは数字以外が含まれると保存できないこと' do
        @pay_deli.phone_number = "11aa111111"
        @pay_deli.valid?
        expect(@pay_deli.errors.full_messages).to include("Phone number is not a valid format")
      end
      it 'phone_numberが9文字以下では保存できないこと' do
        @pay_deli.phone_number = "12345678"
        @pay_deli.valid?
        expect(@pay_deli.errors.full_messages).to include("Phone number is not a valid format")
      end
      it 'phone_numberが11文字以上では保存できないこと' do
        @pay_deli.phone_number = "12345678910111"
        @pay_deli.valid?
        expect(@pay_deli.errors.full_messages).to include("Phone number is not a valid format")
      end
      it 'tokenが空だと保存できないこと' do
        @pay_deli.token= nil
        @pay_deli.valid?
        expect(@pay_deli.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていないと保存できないこと' do
        @pay_deli.user_id= nil
        @pay_deli.valid?
        expect(@pay_deli.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できない' do
        @pay_deli.item_id= nil
        @pay_deli.valid?
        expect(@pay_deli.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end