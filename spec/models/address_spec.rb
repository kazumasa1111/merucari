require 'rails_helper'

describe Address do
  describe '#create' do
    it "住所作成 " do
      user    = build(:user)
      address = build(:address, user_id: user.id)
      address.valid?
      expect(address).to be_valid
    end

    it "建物名なしでも登録可能" do
      user    = build(:user)
      address = build(:address, user_id: user.id, apartment_name: "")
      address.valid?
      expect(address).to be_valid
    end

    it "お届け電話番号なしでも登録可能" do
      user    = build(:user)
      address = build(:address, user_id: user.id, phone_number: "")
      address.valid?
      expect(address).to be_valid
    end

    it "苗字なしでは登録できません" do
      user    = build(:user)
      address = build(:address, user_id: user.id, ship_family_name: "")
      address.valid?
      expect(address.errors[:ship_family_name]).to include("を入力してください")
    end

    it "名前なしでは登録できません" do
      user    = build(:user)
      address = build(:address, user_id: user.id, ship_first_name: "")
      address.valid?
      expect(address.errors[:ship_first_name]).to include("を入力してください")
    end

    it "カナ苗字なしでは登録できません" do
      user    = build(:user)
      address = build(:address, user_id: user.id, ship_family_name_kana: "")
      address.valid?
      expect(address.errors[:ship_family_name_kana]).to include("を入力してください")
    end

    it "カナ名前なしでは登録できません" do
      user    = build(:user)
      address = build(:address, user_id: user.id, ship_first_name_kana: "")
      address.valid?
      expect(address.errors[:ship_first_name_kana]).to include("を入力してください")
    end

    it "郵便番号なしでは登録できません" do
      user    = build(:user)
      address = build(:address, user_id: user.id, postal_code: "")
      address.valid?
      expect(address.errors[:postal_code]).to include("を入力してください")
    end

    it "都道府県なしでは登録できません" do
      user    = build(:user)
      address = build(:address, user_id: user.id, prefecture_id: nil)
      address.valid?
      expect(address.errors[:prefecture_id]).to include("を入力してください")
    end

    it "市区町村なしでは登録できません" do
      user    = build(:user)
      address = build(:address, user_id: user.id, municipality: "")
      address.valid?
      expect(address.errors[:municipality]).to include("を入力してください")
    end

    it "番地なしでは登録できません" do
      user    = build(:user)
      address = build(:address, user_id: user.id, block_number: "")
      address.valid?
      expect(address.errors[:block_number]).to include("を入力してください")
    end

    it "郵便番号はハイフンで区切らないと登録できません" do
      user    = build(:user)
      address = build(:address, user_id: user.id, postal_code: "1234567")
      address.valid?
      expect(address.errors[:postal_code]).to include("は不正な値です")
    end
  end
end