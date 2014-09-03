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


Given(/^A database populated with users and books$/) do
  users = populate_users
  populate_books users
end

# Ratings

Given(/^TestAdmin bans (\d+) users from rating$/) do |arg1|
  sign_in_as_admin
  visit '/admin/users'
  (0..arg1.to_i).each do |n|
    user = @users[n]
    check_can_do_box_for user, 'rate', false
  end
end

Then(/^The (\d+) users cannot rate books$/) do |arg1|
  (0..arg1.to_i).each do |user_i|
    user = User.find(@users[user_i].id)
    login_as user

    visit book_path(@approved_books[0])
    expect(has_css?("#user_star")).to eq(false)
  end
end


Then(/^TestAdmin allows the (\d+) users to rate again$/) do |arg1|
  sign_in_as_admin
  visit '/admin/users'
  (0..arg1.to_i).each do |n|
    user = @users[n]
    check_can_do_box_for user, 'rate', true
  end
end

Then(/^The (\d+) users try to rate a book (\d+)$/) do |arg1, arg2|
  (0..arg1.to_i).each do |user_i|
    user = User.find(@users[user_i].id)
    login_as user

    visit book_path(@approved_books[0])
    page.find("#user_star").find_by_id("5").click
  end
end

Then(/^The rating for the book is (\d+)$/) do |arg1|
  visit book_path @approved_books[0]
  expect(page.find("#star #score_input", :visible => false).value).to eq("5")
end

# ban reviewing
Given(/^TestAdmin bans (\d+) users from reviewing books$/) do |arg1|
  sign_in_as_admin
  visit '/admin/users'
  (0..arg1.to_i).each do |n|
    user = @users[n]
    check_can_do_box_for user, 'review', false
  end
end

Then(/^The (\d+) users cannot review books$/) do |arg1|
  (0..arg1.to_i).each do |n|
    user = User.find @users[n].id
    expect(user.banned_from_reviewing).to eq(true)
  end
end

# make admins
Given(/^Test admin makes (\d+) users into admins$/) do |arg1|
  sign_in_as_admin
  visit '/admin/users'
  (0..arg1.to_i).each do |n|
    user = @users[n]
    check_can_do_box_for user, 'admin', true
  end
end

Then(/^Those (\d+) users are admins$/) do |arg1|
  (0..arg1.to_i).each do |n|
    user = User.find @users[n].id
    expect(user.is_admin?).to eq(true)
  end
end
