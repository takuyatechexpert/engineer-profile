require 'rails_helper'

describe User do
  describe '#create' do

    # userのnameがないと保存できないか?
    it "is invalid without a name" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    # emailがないと保存できないか?
    it "is invalid without an email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    # password確認がないと保存できないか
    it "is invalid without an password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    # password確認がないと保存できないか
    it "is invalid without an password_confirmation" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    # passwordが6文字以上で登録できるか
    it "is valid with a password that has more than 6 characters" do
      user = build(:user, password: "123456", password_confirmation: "123456")
      user.valid?
      expect(user).to be_valid
    end

    # passwordが5文字以下だと登録できないか
    it "is invalid with a password that has less than 5 characters" do
      user = build(:user, password: "12345", password_confirmation: "12345")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end


    # name, email, password, password_confirmationの全てが入力されている場合に登録できるか
    it "is valid with a name, email, password, password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end

    # emailに重複がないか
    it "is invalid with a duplicate email address" do
      #はじめにユーザーを登録
      user = create(:user)
      #先に登録したユーザーと同じemailの値を持つユーザーのインスタンスを作成
      another_user = build(:user, email: user.email)
      # email: user.emailではじめに作成したユーザーのemailを代入している
      # fakerを使用しているのでuserがランダム生成されてしまう為、buildで2つ目のユーザーを作成すると「値」もランダム再生されてしまうので
      # 同じemailでないので重複のテストができない。その為、はじめに作成したユーザーのemailを2つ目に作成したユーザーのemailに代入している
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end
  
  end
end