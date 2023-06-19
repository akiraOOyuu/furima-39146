require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item) 
  end

  describe '商品出品の保存' do
    context '商品投稿が投稿できる場合' do
      
      it '画像とタイトル、テキスト、カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数、販売価格があれば投稿できる' do
        expect(@item).to be_valid
      end
      it '販売価格が半角数字だと投稿できる' do
        @item.price
      end
      it '販売価格が300から9999999だと投稿できる' do
        @item.price = Faker::Number.between(from: 100, to: 9999)
        expect(@item).to be_valid
      end
    end

    context '商品出品できない場合' do       #異常系
      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
         expect(@item.errors.full_messages).to include('User must exist')
    end
      it 'タイトルが空では投稿できない' do
         @item.title = ''
         @item.valid?
         expect(@item.errors.full_messages).to include("Title can't be blank") 
      end     
      it 'テキストが空では投稿できない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank") 
     end     
      it '画像が空では投稿できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank") 
      end
      it '販売価格が全角数字では投稿できない' do
        @item.price = '１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number") 
      end
      it '販売価格が300円未満では投稿できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300") 
      end
      it '販売価格が9,999,999円を超える商品では投稿できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999") 
      end
      it 'カテゴリーidが初期値では投稿できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank") 
      end     
      it '商品の状態idが初期値では投稿できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank") 
      end
      it '配送料負担idが初期値では投稿できない' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank") 
      end
      it '発送元の地域idが初期値では投稿できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank") 
      end 
      it '発送までの日数idが初期値では投稿できない' do
        @item.deli_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Deli day can't be blank") 
      end 
     
    end
  end
end
