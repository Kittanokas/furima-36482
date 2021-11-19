require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録' do
    context '新規登録できる場合' do
      it 'nicknameとemail、passwordとpassword_confirmation、kanji_last_name, kanji_first_name, kana_last_name, kana_first_name, birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
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
      it 'kanji_first_nameが空では登録できない' do
        @user.Kanji_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanji first name can't be blank")
      end
      it 'kanji_last_nameが空では登録できない' do
        @user.Kanji_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanji last name can't be blank")
      end
      it 'kana_first_nameが空では登録できない' do
        @user.Kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end
      it 'kana_last_nameが空では登録できない' do
        @user.Kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name can't be blank")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it '重複したメールアドレスは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスに@を含まない場合は登録できない' do
        @user.email = 'aaaaa.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードが6文字未満では登録できない' do
        @user.password = '1234a'
        @user.password_confirmation = '1234a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it '英字のみのパスワードでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it '数字のみのパスワードでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'ａｂｃ123'
        @user.password_confirmation = 'ａｂｃ123'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'パスワードとパスワード（確認用）が不一致だと登録できない' do
        @user.password = '12345a'
        @user.password_confirmation = '123456a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '姓（全角）に半角文字が含まれていると登録できない' do
        @user.Kanji_last_name = 'suzuki'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kanji last name is invalid')
      end
      it '名（全角）に半角文字が含まれていると登録できない' do
        @user.Kanji_first_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kanji first name is invalid')
      end
      it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.Kana_last_name = '鈴木'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana last name is invalid')
      end
      it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.Kana_first_name = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first name is invalid')
      end
    end
  end
end
