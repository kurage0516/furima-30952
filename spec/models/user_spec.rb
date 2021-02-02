require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nickname、email、password、password_confirmation、name、surname、name_ruby、surname_ruby、birthdayが存在すれば登録できる' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'nameが空では登録できないこと' do
      @user.name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it 'surnameが空では登録できないこと' do
      @user.surname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname can't be blank")
    end

    it 'name_rubyが空では登録できないこと' do
      @user.name_ruby = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Name ruby can't be blank")
    end

    it 'surname_rubyが空では登録できないこと' do
      @user.surname_ruby = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname ruby can't be blank")
    end

    it 'birthdayが空では登録できないこと' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailは@を含む必要があること' do
      @user.email = 'testtest.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'passwordが6文字以上であれば登録できること' do
      @user.password = 'a2s3d4'
      @user.password_confirmation = 'a2s3d4'
      expect(@user).to be_valid
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordは英語のみでは登録できない' do
      @user.password = 'testte'
      @user.password_confirmation = 'testte'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'psswordは数字のみでは登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordは全角では登録できない' do
      @user.password = 'ａｓｄｆｇｈ'
      @user.password_confirmation = 'ａｓｄｆｇｈ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'nameは全角の漢字・平仮名・カタカナ以外では登録できないこと' do
      @user.name = 'Test11'
      @user.valid?
      expect(@user.errors.full_messages).to include('Name is invalid')
    end

    it 'surnameは全角の漢字・平仮名・カタカナ以外では登録できないこと' do
      @user.surname = 'Test11'
      @user.valid?
      expect(@user.errors.full_messages).to include('Surname is invalid')
    end

    it 'name_rubyは全角カタカナ以外では登録できないこと' do
      @user.name_ruby = 'Test11'
      @user.valid?
      expect(@user.errors.full_messages).to include('Name ruby is invalid')
    end

    it 'surname_rubyは全角カタカナ以外では登録できないこと' do
      @user.surname_ruby = 'Test11'
      @user.valid?
      expect(@user.errors.full_messages).to include('Surname ruby is invalid')
    end
  end
end
