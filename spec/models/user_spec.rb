require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録' do 
    context '新規登録できる場合' do
      it "nicknameとemail、passwordとpassword_confirmation、kanji_last_name, kanji_first_name, kana_last_name, kana_first_name, birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end  
    context '新規登録できない場合' do
      it "nicknameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")        
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")        
      end
      it "kanji_first_nameが空では登録できない" do
        @user.Kanji_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanji first name can't be blank")        
      end
      it "kanji_last_nameが空では登録できない" do
        @user.Kanji_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanji last name can't be blank")        
      end
      it "kana_first_nameが空では登録できない" do
        @user.Kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")        
      end
      it "kana_last_nameが空では登録できない" do
        @user.Kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name can't be blank")        
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")        
      end

    end
  end
end