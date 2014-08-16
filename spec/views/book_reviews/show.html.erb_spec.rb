require 'rails_helper'

RSpec.describe "book_reviews/show", :type => :view do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @book = FactoryGirl.create(:book)
    @book_review = assign(:book_review, BookReview.create!(
      :content => "MyText",
      :user => @user,
      :book => @book
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(@user.email)
    expect(rendered).to match(@book.title)
  end
end
