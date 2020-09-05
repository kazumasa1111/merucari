require 'rails_helper'

describe Product do
  describe '#create', '#update' do

    it "以外存在すれば登録できる" do
      product = build(:product)
      expect(product).to be_valid
    end

    it "商品名がないと登録できない" do
      product = build(:product, name: nil)
      product.valid?
      expect(product.errors[:name]).to include("を入力してください")
    end

    it "商品説明がないと登録できない" do
      product = build(:product, description_of_item: nil)
      product.valid?
      expect(product.errors[:description_of_item]).to include("を入力してください")
    end

    it "商品の状態がないと登録できない" do
      product = build(:product, commodity_condition: nil)
      product.valid?
      expect(product.errors[:commodity_condition]).to include("を入力してください")
    end

    it "配送料の負担がないと登録できない" do
      product = build(:product, shipping_charges: nil)
      product.valid?
      expect(product.errors[:shipping_charges]).to include("を入力してください")
    end

    it "発送までの日数がないと登録できない" do
      product = build(:product, days_until_shipping: nil)
      product.valid?
      expect(product.errors[:days_until_shipping]).to include("を入力してください")
    end

    it "発送元の地域がないと登録できない" do
      product = build(:product, prefecture_id: nil)
      product.valid?
      expect(product.errors[:prefecture_id]).to include("を入力してください")
    end

    it "価格がないと登録できない" do
      product = build(:product, price: nil)
      product.valid?
      expect(product.errors[:price]).to include("を入力してください")
    end

    it "商品名が40文字以上あると登録できない" do
      product = build(:product, name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      product.valid?
      expect(product.errors[:name]).to include("は40文字以内で入力してください")
    end

    it "商品説明が1000文字以上あると登録できない" do
      product = build(:product, description_of_item: "asasassasasasasasasasasasasasasasasasasasasasasasasasasasasasasasasasasasasasasasaasaasasasasasasaaaaaaaaaaaaaaaaaaalalalalallallalalalallallalallalalallalalalalallalalalallalalalalalalallalaallalalalaalalalalalalalalalalalalalaaalalalalalalalalalalalalalalalalalalalalalalalalalalalalalalalalalalalalaalalalalalalalalalalalalalalalalalalalalalalalaalalalalalalalalalalalalallllllallaalallalalalallalalalallalalallalallalallalallalallalaalalalallaalalalalalalalalalalalalalalalalaalalalaalalalalallalalalalalalalalalalalalallaalalalalalalalalalalaalallaallaallalalalalalalalalalalalalalalalalalalalalalalaaaaalalalalalalalalalalalalalalalalalallalalalalalalallalalalalalalalalalallalalalalalalalalalalalalalalalalalalalaaalalalaalalalalalalalalalalalalalalalalalalalalalalalalalalalalalllalalalalaallalallalallalllllllllllllllllllllllllllllllllllllあああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああ")
      product.valid?
      expect(product.errors[:description_of_item]).to include("は1000文字以内で入力してください")
    end

    it "価格が300円未満は登録できない" do
      product = build(:product, price: 100)
      product.valid?
      expect(product.errors[:price]).to include("は299より大きい値にしてください")
    end

    it "価格が10000000円以上は登録できない" do
      product = build(:product, price: 10000000)
      product.valid?
      expect(product.errors[:price]).to include("は10000000より小さい値にしてください")
    end
    
  end
end