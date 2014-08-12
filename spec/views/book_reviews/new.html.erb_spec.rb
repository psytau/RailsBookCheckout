require 'rails_helper'

RSpec.describe "book_reviews/new", :type => :view do
  before(:each) do
    assign(:book_review, BookReview.new(
      :content => "MyText",
      :user => nil,
      :book => nil
    ))
  end

  it "renders new book_review form" do
    render

    assert_select "form[action=?][method=?]", book_reviews_path, "post" do

      assert_select "textarea#book_review_content[name=?]", "book_review[content]"

      assert_select "input#book_review_user_id[name=?]", "book_review[user_id]"

      assert_select "input#book_review_book_id[name=?]", "book_review[book_id]"
    end
  end
end
