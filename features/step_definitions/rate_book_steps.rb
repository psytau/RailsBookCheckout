
Given(/^A book exists in the system$/) do
  Book.find_or_create_by(author: "Stupid Guy", title: "Some book")
end

Given(/^TestUser visits the book index page$/) do
  visit books_path
end

When(/^User gives a rating of 5 stars$/) do
  binding.pry
  page.find("img#5").click
end

Then(/^Book has a user rating of 5 stars$/) do
  visit books_path
  expect(page.find('input#score').value).to eq(5)
end