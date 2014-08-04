require 'rails_helper'

RSpec.describe "books/edit", :type => :view do
  before(:each) do
    @book = assign(:book, Book.create!(
      :author => "MyString",
      :title => "MyString",
      :status => "MyString",
      :isbn => "MyString",
      :rating => 1,
      :active => false
    ))
  end

  it "renders the edit book form" do
    render

    assert_select "form[action=?][method=?]", book_path(@book), "post" do

      assert_select "input#book_author[name=?]", "book[author]"

      assert_select "input#book_title[name=?]", "book[title]"

      assert_select "input#book_status[name=?]", "book[status]"

      assert_select "input#book_isbn[name=?]", "book[isbn]"

      assert_select "input#book_rating[name=?]", "book[rating]"

      assert_select "input#book_active[name=?]", "book[active]"
    end
  end
end