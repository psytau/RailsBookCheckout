
Given /^TestUser is logged in$/ do
  email = 'testing@man.net'
  password = 'secretpass'
  User.new(:email => email, :password => password, :password_confirmation => password).save!

  visit '/users/sign_in'
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button "Sign in"
end

When /^(\w+) adds a book on the add book page$/ do |user|
  visit '/books/new'
  fill_in "Author", :with => 'Judy Bloom'
  fill_in "Title", :with => 'Blubber'
  fill_in "Isbn", :with => '123456789'
  fill_in "Rating", :with => '4'
  click_button "Create Book"
end

Then(/^The book is added to the libarary database, but is not approved$/) do
  expect(page).to have_content('Book was successfully created')
  expect(page).to have_content 'Active: false'
end

Given(/^No one is logged in$/) do

end

And (/^User visits the add book page$/) do
  visit '/books/new'
end

Then(/^The User is redirected to the sign in page$/) do
    expect(page).to have_content 'Forgot your password?'
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
