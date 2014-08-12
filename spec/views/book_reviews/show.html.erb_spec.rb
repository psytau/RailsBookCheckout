require 'rails_helper'

RSpec.describe "book_reviews/show", :type => :view do
  before(:each) do
    @book_review = assign(:book_review, BookReview.create!(
      :content => "MyText",
      :user => nil,
      :book => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
