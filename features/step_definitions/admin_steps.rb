Given(/^A database populated with users$/) do
  populate_users
end

Given(/^(\d+) users add (\d+) books each$/) do |user_count, book_count|
      @users[0..4].each do |user|
        user_creates_a_book user, :title => "Autobiograph of #{user.lastname}",
          author: user.lastname,
          isbn: rand_isbn
      end
end

Given(/^AdminUser signs in$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^AdminUser can see (\d+) users with (\d+) books each on the stats page$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end
