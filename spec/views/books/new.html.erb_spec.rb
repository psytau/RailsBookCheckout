require 'rails_helper'

RSpec.describe "books/new", :type => :view do
  before(:each) do
    assign(:book, Book.new(
      :author => "MyString",
      :title => "MyString",
      :status => "MyString",
      :isbn => "MyString",
      :rating => 1,
      :active => false
    ))
    # mock cancan abilities
    # http://stackoverflow.com/questions/5018344/testing-views-that-use-cancan-and-devise-with-rspec
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    controller.stub(:current_ability) { @ability }
  end

  it "renders new book form" do
    @ability.can :approve, Book
    render

    assert_select "form[action=?][method=?]", books_path, "post" do

      assert_select "input#book_author[name=?]", "book[author]"

      assert_select "input#book_title[name=?]", "book[title]"

      assert_select "input#book_status[name=?]", "book[status]"

      assert_select "input#book_isbn[name=?]", "book[isbn]"

      assert_select "input#book_rating[name=?]", "book[rating]"

      assert_select "input#book_active[name=?]", "book[active]"
    end
  end
end
