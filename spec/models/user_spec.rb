require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    
    it "全ての値が正常に入力されてたら登録できる" do
      expect(@user).to be_valid
    end
    
    it "passwordが6文字以上であれば登録できること" do
      @user.password = "kkkkk1"
      @user.password_confirmation = "kkkkk1"
      expect(@user).to be_valid
    end

    it "passwordが空では登録できない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが5文字以下であれば登録できないこと" do
      @user.password ="12345"
      @user.password_confirmation ="12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordとpassword_confirmationは値が同じじゃないと登録出来ない" do
      @user.password = "123456"
      @user.password_confirmation = "1234567"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordが英語のみでは登録できない" do
      @user.password = "abcdef"
      @user.password_confirmation = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include( "Password is invalid")
    end

    it "passwordが数字のみでは登録できない" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "passwordが全角では登録できない" do
      @user.password = "全角全角全角"
      @user.password_confirmation = "全角全角全角"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "nicknameが空だと登録できない" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "emailに@が含まれていないと登録できない" do
      @user.email = "samplegamil.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "first_nameが空では登録できない" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
    end

    it "first_nameは漢字・平仮名・カタカナ以外では登録できない" do
      @user.first_name = "abc"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it "last_nameが空では登録できない" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid")
    end

    it "last_nameは漢字・平仮名・カタカナ以外では登録できない" do
      @user.last_name = "abc"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end

    it "first_kataが空では登録できない" do
      @user.first_kata = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First kata can't be blank", "First kata is invalid")
    end

    it "first_kataは全角カタカナ以外では登録できない" do
      @user.first_kata = "あいう"
      @user.valid?
      expect(@user.errors.full_messages).to include("First kata is invalid")
    end

    it "last_kataが空では登録できない" do
      @user.last_kata = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last kata can't be blank", "Last kata is invalid")
    end

    it "last_kataは全角カタカナ以外では登録できないこと" do
      @user.last_kata = "かきく"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last kata is invalid")
    end

    it "birthdayが空では登録できない" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
