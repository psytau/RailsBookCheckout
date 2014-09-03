Given(/^A database populated with users$/) do
  populate_users
end

Given(/^(\d+) users add (\d+) books each$/) do |user_count, book_count|
     @users[0..(user_count.to_i)].each do |user|
         1...(book_count.to_i).times do
          user_creates_a_book user, :title => "Autobiograph of #{user.lastname}",
            author: user.lastname,
            isbn: rand_isbn
         end
      end
end

Given(/^AdminUser signs in$/) do
  sign_in_as_admin
end

Then(/^AdminUser can see (\d+) users with (\d+) books each on the stats page$/) do |arg1, arg2|
  visit '/admin/users_report'
  (0..(arg1.to_i)).each do |n|
    book_count = page.find("#user-row-#{@users[n].id}").find("td.book-count").text
    expect(book_count).to eq(arg2.to_s)
  end
end
