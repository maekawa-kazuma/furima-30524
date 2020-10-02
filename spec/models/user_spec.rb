require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nicknameとemailとpasswordとpassword_confirmationとlast_name,first_nameとlast_name_read,first_name_readとbirth_dateが存在すれば登録できること' do
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

    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      @user.password_confirmation = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it 'last_nameが空では登録できないこと' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'first_nameが空では登録できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'last_name_readが空では登録できないこと' do
      @user.last_name_read = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name read can't be blank")
    end

    it 'first_name_readが空では登録できないこと' do
      @user.first_name_read = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name read can't be blank")
    end

    it 'birth_dateが空では登録できないこと' do
      @user.birth_date = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end

    it 'passwordが6文字以上であれば登録できること' do
      @user.password = 'a1a1a1'
      @user.password_confirmation = 'a1a1a1'
      expect(@user).to be_valid
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = 'a1a1a'
      @user.password_confirmation = 'a1a1a'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'メールアドレスが重複すると登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'メールアドレスに@がついていない場合は登録できないこと' do
      @user.email = 'aaa.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'passwordとpassword_confirmationが一致していない場合は登録できないこと' do
      @user.password_confirmation = 'aaaaa1'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'last_nameが全角でない場合は登録できないこと' do
      @user.last_name = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
    end

    it 'first_nameが全角でない場合は登録できないこと' do
      @user.first_name = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end

    it 'last_name_readが全角カナでない場合は登録できないこと' do
      @user.last_name_read = 'てすと'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name read is invalid')
    end

    it 'first_name_readが全角カナでない場合は登録できないこと' do
      @user.first_name_read = 'てすと'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name read is invalid')
    end
  end
end
