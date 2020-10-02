require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nicknameとemailとpasswordとpassword_confirmationとlast_name,first_nameとlast_name_read,first_name_readとbirth_dateが存在すれば登録できること" do
      
    end

    it "nicknameが空では登録できないこと" do
      
    end

    it "emailが空では登録できないこと" do
      
    end

    it "passwordが空では登録できないこと" do
      
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      
    end

    it "last_nameが空では登録できないこと" do
      
    end

    it "first_nameが空では登録できないこと" do
      
    end

    it "last_name_readが空では登録できないこと" do
      
    end

    it "first_name_readが空では登録できないこと" do
      
    end

    it "birth_dateが空では登録できないこと" do
      
    end

    it "passwordが6文字以上であれば登録できること" do

    end

    it "passwordが5文字以下であれば登録できないこと" do
      
    end

    it "メールアドレスが重複すると登録できないこと" do
      
    end

    it "メールアドレスに@がついていない場合は登録できないこと" do
      
    end

    it "passwordとpassword_confirmationが一致していない場合は登録できないこと" do
      
    end

    it "last_nameが全角でない場合は登録できないこと" do
      
    end

    it "first_nameが全角でない場合は登録できないこと" do
      
    end

    it "last_name_readが全角カナでなければ登録できないこと" do
      
    end

    it "first_name_readが全角カナでなければ登録できないこと" do
      
    end

  end
end
