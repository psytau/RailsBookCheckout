require 'rails_helper'

RSpec.describe "book_reviews/index", :type => :view do
  before(:each) do
    assign(:book_reviews, [
      BookReview.create!(
        :content => "MyText",
        :user => nil,
        :book => nil
      ),
      BookReview.create!(
        :content => "MyText",
        :user => nil,
        :book => nil
      )
    ])
  end

  it "renders a list of book_reviews" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
