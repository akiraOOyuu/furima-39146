require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録できるとき' do

    it 'nicknameとemail、passwordとpassword_confirmation,first_name,last_name,first_name_reading,last_name_reading,birth_dateが存在すれば登録できる' do
      @user = FactoryBot.build(:user)
    end
    it 'passwordが英数字混合だと登録できる' do
      @user.password
    end
    it 'first_name,last_name,first_name_reading,last_name_readingが全角だと登録できる' do
      @user.first_name
      @user.last_name
      @user.first_name_reading
      @user.last_name_reading
    end
  end
  context '新規登録できないとき' do
    
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
    end
    it 'last_nameが半角文字では登録できない' do
      @user.last_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    it 'first_nameが_reading半角文字では登録できない' do
      @user.first_name_reading = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include( "First name reading is invalid")
    end
    it 'last_nameが_reading空では登録できない' do
      @user.last_name_reading = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name reading can't be blank", "Last name reading is invalid")
    end
    it 'birth_dateが空では登録できない' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = "aaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it 'emailは空では登録できない' do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'passwordが英数字混合でなければ登録できない' do
      @user.password = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
   
  end
end
