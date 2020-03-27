require 'rails_helper'

# userのnameがないと保存できないか?
describe User do
  describe '#create' do
    it "is invalid without a name" do
      user = User.new(name: "")
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end
  end

  # emailがないと保存できないか?
  describe '#create' do
    it "is invalid without a email" do
      user = User.new(email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
  end

  # passwordがないと保存できないか?
  describe '#create' do
    it "is invalid without a password" do
      user = User.new(password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
  end

  # password確認がないと保存できないか
  describe '#create' do
    it "is valid with a password_confirmation" do
      user = User.new(password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
  end

end