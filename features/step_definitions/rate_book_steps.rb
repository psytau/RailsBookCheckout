
Given(/^A book exists in the system$/) do
  #Book.find_or_create_by(author: "Stupid Guy", title: "Some book", approved_at: Time.now)
  @book = FactoryGirl.create :book
end

Given(/^TestUser visits the show book page$/) do
  visit book_path(@book)
end

Given(/^TestUser visits the book index page$/) do
  visit books_path
end

When(/^User gives a rating of 5 stars$/) do
  page.find("#user_star").find_by_id("5").click
end

Then(/^Book has a user rating of 5 stars$/) do
  visit books_path
  expect(page.find_by_id('star_1')[:title]).to eq("gorgeous")
end
