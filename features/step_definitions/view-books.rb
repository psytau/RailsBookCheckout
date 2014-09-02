
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
  click_button "Create Book"
end

Then(/^The book is added to the libarary database, but is not approved$/) do
  expect(page).to have_content('Book was successfully created')
  book = Book.last
  expect(book.active).to be_falsey
end

Given(/^No one is logged in$/) do

end

And (/^User visits the add book page$/) do
  visit '/books/new'
end

Then(/^The User is redirected to the sign in page$/) do
    expect(page).to have_content 'Forgot your password?'
end

When(/^TestAdmin is logged in$/) do
  click_link "Logout"
  @admin = FactoryGirl.create(:admin)
  print @admin.email
  print @admin.is_admin?
  visit '/users/sign_in'
  fill_in "user_email", :with => @admin.email
  fill_in "user_password", :with => @admin.password
  click_button "Sign in"
end

And(/^The Book is not approved$/) do
  book = Book.last
  expect(book.active).to be_falsey
end

When(/^TestAdmin visits the approve books page and approves the book$/) do
  book = Book.last
  visit "/books/#{book.id}/edit"
  check 'Active'
  click_button 'Update Book'
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
