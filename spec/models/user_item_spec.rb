require 'rails_helper'

RSpec.describe UserItem, type: :model do
  describe '商品購入機能' do
    before do
      @user_item = FactoryBot.build(:user_item)
    end

    it "全ての値が正常に入力されてたら購入できる" do
      expect(@user_item).to be_valid
    end

    it "建物名が空でも登録できる" do
      @user_item.building_name = nil
      expect(@user_item).to be_valid
    end

    it "郵便番号が空では購入できない" do
      @user_item.postal_code = nil
      @user_item.valid?
      expect(@user_item.errors.full_messages).to include("Postal code can't be blank")
    end

    it "郵便番号にハイフンがないと購入できない" do
      @user_item.postal_code = '1234567'
      @user_item.valid?
      expect(@user_item.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end

    it "都道府県についての情報がないと購入できない" do
      @user_item.prefecture = 0
      @user_item.valid?
      expect(@user_item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it "市区町村が空では購入できない" do
      @user_item.municipality = nil
      @user_item.valid?
      expect(@user_item.errors.full_messages).to include("Municipality can't be blank")
    end

    it "番地が空では購入できない" do
      @user_item.address = nil
      @user_item.valid?
      expect(@user_item.errors.full_messages).to include("Address can't be blank")
    end

    it "電話番号が空では購入できない" do
      @user_item.phone_number = nil
      @user_item.valid?
      expect(@user_item.errors.full_messages).to include("Phone number can't be blank")
    end

    it "電話番号が11桁じゃないと購入できない" do
      @user_item.phone_number = 123456789123
      @user_item.valid?
      expect(@user_item.errors.full_messages).to include("Phone number is invalid")
    end

    it "tokenが空では登録できないこと" do
      @user_item.token = nil
      @user_item.valid?
      expect(@user_item.errors.full_messages).to include("Token can't be blank")
    end


  end
end