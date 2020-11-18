require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @item = FactoryBot.build(:item)
    end

    it "全ての値が正常に入力されてたら登録できる" do
      expect(@item).to be_valid
    end

    it "商品の画像がないと出品できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "商品名がないと出品できない" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "商品の説明がないと出品できない" do
      @item.information = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Information can't be blank")
    end

    it "カテゴリー情報がないと出品できない" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it "cotegory_idが空の場合は出品できない" do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
    end

    it "商品の状態の指定がないと出品できない" do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end

    it "condition_idが空の場合は出品できない" do
      @item.condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank", "Condition is not a number")
    end

    it "配送料の負担について情報がないと出品できない" do
      @item.delivery_price_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery price must be other than 1")
    end
    
    it "delivery_price_idが空の場合は出品できない" do
      @item.delivery_price_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery price can't be blank", "Delivery price is not a number")
    end

    it "発送元の地域についての情報がないと出品できない" do
      @item.shipment_source_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipment source must be other than 1")
    end

    it "shipment_source_idが空の場合は出品できない" do
      @item.shipment_source_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipment source can't be blank", "Shipment source is not a number")
    end

    it "発送までの日数について情報がないと出品できない" do
      @item.days_to_ship_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include( "Days to ship must be other than 1")
    end

    it "days_to_ship_idが空の場合は出品できない" do
      @item.days_to_ship_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Days to ship can't be blank", "Days to ship is not a number")
    end

    it "価格について情報がないと出品できない" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "価格が300円以下だと出品できない" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it "価格が9999999円以上だと出品できない" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it "価格が半角数字でないと出品できない" do
      @item.price = "１０００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    




    

end
end
