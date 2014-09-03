
Given(/^TestUser is logged in$/)do
  sign_out_all
  sign_in_as_test_user
end

When(/^(\w+) adds a book on the add book page$/)do |user|
  visit '/books/new'
  fill_in "Author", :with => 'Judy Bloom'
  fill_in "Title", :with => 'Blubber'
  fill_in "Isbn", :with => '123456789'
  click_button "Create Book"
end

Then(/^The book is added to the libarary database, but is not approved$/) do
  expect(page).to have_content('Book was successfully created')
  book = Book.last
  expect(book.active).to be_falsey
end

Given(/^No one is logged in$/) do
  sign_out_all
end

And (/^User visits the add book page$/) do
  visit '/books/new'
end

Then(/^The User is redirected to the sign in page$/) do
    expect(page).to have_content 'Forgot your password?'
end

When(/^TestAdmin is logged in$/) do
  sign_in_as_admin
end

And(/^The Book is not approved$/) do
  book = Book.last
  expect(book.active).to be_falsey
end

When(/^TestAdmin visits the approve books page and approves the book$/) do
  book = Book.last
  visit "/books/#{book.id}"
  click_link 'Activate'
end

Then(/^The book is now approved$/) do
  book = Book.last
  expect(book.active).to be_truthy
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
