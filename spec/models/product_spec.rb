require 'rails_helper'

describe Product do
  context "when the product has comments" do
    before do
      @product = FactoryGirl.create(:product)
      @user = FactoryGirl.create(:user)
      @product.comments.create!(rating: 1, user: @user, body: "I don't like this!")
      @product.comments.create!(rating: 3, user: @user, body: "Not too bad")
      @product.comments.create!(rating: 5, user: @user, body: "Wow, this is a great record!")
    end

    it "returns the average rating of all comments" do
      expect(@product.average_rating).to eq 3
    end

    it "is not valid" do
      expect(@product = Product.new(description: "A record suitable for all ages")).not_to be_valid
    end

  end
end