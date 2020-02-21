require 'rails_helper'
describe Item do
  describe '#create' do
  
    # presence: true 
    it "is valid with a name, price, content, condition, shipping, shipping_area, days_to_ship, shipping_method, status" do
      user = build(:user)
      item = build(:item)
      expect(item).to be_valid
    end

    it "is invalid without name" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "is invalid without price" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end
  
    it "is invalid without content" do
      item = build(:item, content: "")
      item.valid?
      expect(item.errors[:content]).to include("can't be blank")
    end

    it "is invalid without condition" do
      item = build(:item, condition: "")
      item.valid?
      expect(item.errors[:condition]).to include("can't be blank")
    end

    it "is invalid without shipping" do
      item = build(:item, shipping: "")
      item.valid?
      expect(item.errors[:shipping]).to include("can't be blank")
    end

    it "is invalid without shipping_area" do
      item = build(:item, shipping_area: "")
      item.valid?
      expect(item.errors[:shipping_area]).to include("can't be blank")
    end
   
    it "is invalid without days_to_ship" do
      item = build(:item, days_to_ship: "")
      item.valid?
      expect(item.errors[:days_to_ship]).to include("can't be blank")
    end  

    it "is invalid without shipping_method" do
      item = build(:item, shipping_method: "")
      item.valid?
      expect(item.errors[:shipping_method]).to include("can't be blank")
    end  

    it "is invalid without status" do
      item = build(:item, status: "")
      item.valid?
      expect(item.errors[:status]).to include("can't be blank")
    end 

    
    # max length
    it "is invalid with a name that has more than 41 characters " do
      item = build(:item, name: "a" * 41)
      item.valid?
      expect(item.errors[:name]).to include("is too long (maximum is 40 characters)")
    end

    it "is invalid with a content that has more than 1001 characters " do
      item = build(:item, content: "a" * 1001)
      item.valid?
      expect(item.errors[:content]).to include("is too long (maximum is 1000 characters)")
    end

    it "is valid with a name that has less than 40 characters " do
     item = build(:item, name: "a" * 40)
      expect(item).to be_valid
    end

    it "is valid with a content that has less than 1000 characters " do
      item = build(:item, content: "a" * 1000)
      expect(item).to be_valid
    end
  end
end