require 'rails_helper'

RSpec.describe "book_reviews/edit", :type => :view do
  before(:each) do
    @book_review = assign(:book_review, BookReview.create!(
      :content => "MyText",
      :user => nil,
      :book => nil
    ))
  end

  it "renders the edit book_review form" do
    render

    assert_select "form[action=?][method=?]", book_review_path(@book_review), "post" do

      assert_select "textarea#book_review_content[name=?]", "book_review[content]"

    end
  end
end
