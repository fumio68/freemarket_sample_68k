require 'rails_helper'
describe ItemImage do
  describe '#create' do
    it "is valid with a image" do
      item = build(:item)
      item_image = build(:item_image)
      expect(item_image).to be_valid
    end
    
    it "is invalid without image" do
      item_image = build(:item_image, image:"")
      item_image.valid?
      expect(item_image.errors[:image]).to include("can't be blank")
    end
  end
end