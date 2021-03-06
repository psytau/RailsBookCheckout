require 'rails_helper'

RSpec.describe "books/show", :type => :view do
  before(:each) do
    @book = assign(:book, Book.create!(
      :author => "Author",
      :title => "Title",
      :status => "Status",
      :isbn => "Isbn",
      :active => false
    ))
    # mock cancan abilities
    # http://stackoverflow.com/questions/5018344/testing-views-that-use-cancan-and-devise-with-rspec
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    controller.stub(:current_ability) { @ability }

    # add a book review
    @book_review = BookReview.new book: @book
    @book_reviews = @book.book_reviews
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Author/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/Isbn/)
    expect(rendered).to match(/false/)
  end
end
