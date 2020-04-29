require 'rails_helper'

RSpec.describe Post, type: :model do

    # titleがないと保存できないか?
    it "is invalid without an title" do
      post = build(:post, title: "")
      post.valid?
      expect(post.errors[:title]).to include("can't be blank")
    end

    # commentがないと保存できないか?
    it "is invalid without an comment" do
      post = build(:post, comment: "")
      post.valid?
      expect(post.errors[:comment]).to include("can't be blank")
    end

    # imageがないと保存できないか?
    it "is invalid without an image" do
      post = build(:post, image: "")
      post.valid?
      expect(post.errors[:image]).to include("can't be blank")
    end

    # title,comment,imageがある時に保存できるかどうか?
    it "is valid with a title, comment, image" do
      post = build(:post)
      expect(post).to be_valid
    end
    
end
