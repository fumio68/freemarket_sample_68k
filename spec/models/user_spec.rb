require 'rails_helper'
describe User do 
  describe '#create' do  

    # presence: true 

    it "is valid with a nickname, email, encrypted_password, family_name, last_name, j_family_name, j_last_name, b_year, b_month, b_date" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "is invalid without email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid without password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "is invalid without family_name " do
      user = build(:user, family_name: "")
      user.valid?
      expect(user.errors[:family_name]).to include("can't be blank")
    end

    it "is invalid without last_name " do
      user = build(:user, last_name: "")
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    it "is invalid without j_family_name " do
      user = build(:user, j_family_name: "")
      user.valid?
      expect(user.errors[:j_family_name]).to include("can't be blank")
    end

    it "is invalid without j_last_name " do
      user = build(:user, j_last_name: "")
      user.valid?
      expect(user.errors[:j_last_name]).to include("can't be blank")
    end

    it "is invalid without b_year " do
      user = build(:user, b_year: "")
      user.valid?
      expect(user.errors[:b_year]).to include("can't be blank")
    end

    it "is invalid without b_month " do
      user = build(:user, b_month: "")
      user.valid?
      expect(user.errors[:b_month]).to include("can't be blank")
    end

    it "is invalid without b_date " do
      user = build(:user, b_date: "")
      user.valid?
      expect(user.errors[:b_date]).to include("can't be blank")
    end


    #uniqueness: true  
    it "is invalid with a duplicate email " do
      user = create(:user)

      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    #length: {minimum: 7}
    it "is valid with a password that has more than 7 characters" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid with a password that has less than 6 characters" do
      user = build(:user, password: "000000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
    end

    # format: {with:}
    it "is invalid without @ in the email" do
      user = build(:user, email: "kkkgmail.com")
      user.valid?
      expect(user.errors[:email]).to include("is invalid")
    end

    it "is invalid without a domain in the email" do
      user = build(:user, email: "kkk@.com")
      user.valid?
      expect(user.errors[:email]).to include("is invalid")
    end

    it "is invalid without a character before the @ in the email" do
      user = build(:user, email: "@gmail.com")
      user.valid?
      expect(user.errors[:email]).to include("is invalid")
    end

    it "is invalid with a family_name that has half-width character" do
      user = build(:user, family_name: "abe")
      user.valid?
      expect(user.errors[:family_name]).to include("is invalid")
    end

    it "is invalid with a last_name that has half-width character" do
      user = build(:user, last_name: "コウスケ")
      user.valid?
      expect(user.errors[:last_name]).to include("is invalid")
    end

    it "is invalid with a j_family_name that not has hiragana " do
      user = build(:user, j_family_name: "abe")
      user.valid?
      expect(user.errors[:j_family_name]).to include("is invalid")
    end

    it "is invalid with a j_last_name that not has hiragana " do
      user = build(:user, j_last_name: "kousuke")
      user.valid?
      expect(user.errors[:j_last_name]).to include("is invalid")
    end
  end
end