require 'rails_helper'
describe Purchase do
  describe '#create' do
    # presence: true 
    it "is valid with a postcode, prefecture, city, block" do
      user = build(:user)
      item = build(:item)
      purchase = build(:purchase)
      expect(purchase).to be_valid
    end

    it "is invalid without postcode " do
      purchase = build(:purchase, postcode: "")
      purchase.valid?
      expect(purchase.errors[:postcode]).to include("can't be blank")
    end
    it "is invalid without prefecture " do
      purchase = build(:purchase, prefecture: "")
      purchase.valid?
      expect(purchase.errors[:prefecture]).to include("can't be blank")
    end
    it "is invalid without city " do
      purchase = build(:purchase, city: "")
      purchase.valid?
      expect(purchase.errors[:city]).to include("can't be blank")
    end
    it "is invalid without block " do
      purchase = build(:purchase, block: "")
      purchase.valid?
      expect(purchase.errors[:block]).to include("can't be blank")
    end
  end
end