require 'rails_helper'

RSpec.describe "books/show", :type => :view do
  before(:each) do
    @book = assign(:book, Book.create!(
      :author => "Author",
      :title => "Title",
      :status => "Status",
      :isbn => "Isbn",
      :rating => 1,
      :active => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Author/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/Isbn/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/false/)
  end
end
