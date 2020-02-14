require 'rails_helper'
describe Residence do
  describe '#create' do

    # presence: true 
    it "is valid with a family_name, last_name, j_family_name, j_last_name, postcode, prefecture, city, block" do
      user = build(:user)
      residence = build(:residence ) 
      expect(residence).to be_valid
    end

    it "is invalid without family_name " do
      residence = build(:residence, family_name: "" ) 
      residence.valid?
      expect(residence.errors[:family_name]).to include("is invalid")
    end

    it "is invalid without last_name " do
      residence = build(:residence, last_name: "" ) 
      residence.valid?
      expect(residence.errors[:last_name]).to include("can't be blank")
    end

    it "is invalid without j_family_name " do
      residence = build(:residence, j_family_name: "" ) 
      residence.valid?
      expect(residence.errors[:j_family_name]).to include("can't be blank")
    end

    it "is invalid without j_last_name " do
      residence = build(:residence, j_last_name: "" )
      residence.valid?
      expect(residence.errors[:j_last_name]).to include("can't be blank")
    end

    it "is invalid without postcode " do
      residence = build(:residence, postcode: "" )
      residence.valid?
      expect(residence.errors[:postcode]).to include("can't be blank")
    end

    it "is invalid without prefecture " do
      residence = build(:residence, prefecture: "" )
      residence.valid?
      expect(residence.errors[:prefecture]).to include("can't be blank")
    end

    it "is invalid without city " do
      residence = build(:residence, city: "" )
      residence.valid?
      expect(residence.errors[:city]).to include("can't be blank")
    end

    it "is invalid without block " do
      residence = build(:residence, block: "" )
      residence.valid?
      expect(residence.errors[:block]).to include("can't be blank")
    end


    #format: {with:}

    it "is invalid with a family_name that has half-width character" do
      residence = build(:residence, family_name: "abe" )
      residence.valid?
      expect(residence.errors[:family_name]).to include("is invalid")
    end

    it "is invalid with a last_name that has half-width character" do
      residence = build(:residence, last_name: "コウスケ" )
      residence.valid?
      expect(residence.errors[:last_name]).to include("is invalid")
    end

    it "is invalid with a j_family_name that not has hiragana " do
      residence = build(:residence, j_family_name: "abe" )
      residence.valid?
      expect(residence.errors[:j_family_name]).to include("is invalid")
    end

    it "is invalid with a j_last_name that not has hiragana " do
      residence = build(:residence, j_last_name: "コウスケ" )
      residence.valid?
      expect(residence.errors[:j_last_name]).to include("is invalid")
    end
  end
end