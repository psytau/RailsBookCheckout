require 'rails_helper'


feature "Book Reviews" do
  scenario "User reviews a book" do
    user = FactoryGirl.create :user
    book = FactoryGirl.create :book
    book.user = user
    book.save!

    login_as(user, :scope => :user)
    visit book_path book
    fill_in "book_review_content",
             :with => "This is a heartbreaking tale of breathtaking beauty."
    click_button "Create Book review"
    expect(page).to have_text("a heartbreaking tale")
  end

end
