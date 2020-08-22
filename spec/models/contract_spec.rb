require 'rails_helper'

describe Contract do
  describe '#create' do
    it '購入が可能' do
      user = create(:user)
      contract = build(:contract, buyer_id: user.id)
      contract.valid?
      expect(contract).to be_valid
    end

    it 'product_idなしでは登録出来ない' do
      user = create(:user)
      contract = build(:contract, buyer_id: user.id, product_id: "")
      contract.valid?
      expect(contract.errors[:product_id]).to include("を入力してください")
    end

    it 'buyer_idなしでは登録出来ない' do
      user = create(:user)
      contract = build(:contract, buyer_id: user.id, buyer_id: "")
      contract.valid?
      expect(contract.errors[:buyer_id]).to include("を入力してください")
    end
  end

end