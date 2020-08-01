require 'rails_helper'

describe Product do
  describe '#create' do

    it "画像以外存在すれば登録できる" do
            product = build(:product)
            expect(product).to be_valid
    end
  end
end