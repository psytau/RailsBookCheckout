require 'rails_helper'

RSpec.describe "book_reviews/index", :type => :view do
  before(:each) do
    @book = FactoryGirl.create(:book)
    @user = FactoryGirl.create(:user)
    assign(:book_reviews, [
      BookReview.create!(
        :content => "MyText",
        :user => @user,
        :book => @book
      ),
      BookReview.create!(
        :content => "MyText",
        :user => @user,
        :book => @book
      )
    ])
  end

  it "renders a list of book_reviews" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # assert_select "tr>td", :text => @user.email, :count => 2
    # assert_select "tr>td", :text => @book.title, :count => 2
  end
end
