Given(/^TestUser is logged in$/) do
  visit '/users/sign_in'
  fill_in "user_email", :with => 'b@b.com'
  fill_in "user_password", :with => '12345678'
  click_button "Sign in"
end

When(/^TestUser visits the add book page$/) do
  visit '/books/new'
end

When(/^TestUser adds a book$/) do
  fill_in "Author", :with => 'Judy Bloom'
  fill_in "Title", :with => 'Blubber'
  fill_in "Isbn", :with => '123456789'
  fill_in "Rating", :with => '4'
  click_button "Create Book"
end

Then(/^The book is added to the libarary database, but is not approved$/) do
  expect(page).to have_content 'Book was successfully created'
  expect(page).to have_content 'Active: false'
end

Given(/^TestAdmin is logged in$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^There is a book that has beed added, but approved$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^TestAdmin visits the approve books page$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^TestAdmin approves the book$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^The book is now approved$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^User visits the webpage$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^User accesses the books page when not logged in$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^User can can see all the book titles$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^User can can see all the ratings$/) do
  pending # express the regexp above with the code you wish you had
end
