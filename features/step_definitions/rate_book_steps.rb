
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
  visit book_path(@book)
  page.find("#user_star").find_by_id("5").click
  wait_for_ajax
end

Then(/^Book has a user rating of 5 stars$/) do
  # visit books_path
  visit book_path(@book)
  expect(page.find("#user_star")[:title]).to eq("gorgeous")
  #expect(page.find_by_id('star_1')[:title]).to eq("gorgeous")
end
