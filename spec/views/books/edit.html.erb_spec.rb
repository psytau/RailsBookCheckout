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
    # mock cancan abilities
    # http://stackoverflow.com/questions/5018344/testing-views-that-use-cancan-and-devise-with-rspec
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    controller.stub(:current_ability) { @ability }
  end

  it "renders the edit book form" do
    @ability.can :approve, Book
    render

    assert_select "form[action=?][method=?]", book_path(@book), "post" do

      assert_select "input#book_author[name=?]", "book[author]"

      assert_select "input#book_title[name=?]", "book[title]"

      assert_select "input#book_isbn[name=?]", "book[isbn]"
    end
  end
end
