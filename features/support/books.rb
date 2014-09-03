
#Setup helpers
#

def rand_isbn
  '123456789'
end

def create_book_for user = nil, opts = {}
  book = FactoryGirl.create :book, opts
  book.user = user
  book.save!
  book
end

def approve_book book
  book.active = true
  book.approved_at = Time.now
  book.save!
  book
end

def create_and_approve_book_for user, opts = {}
  approve_book create_book_for(user)
end

def populate_books users, number_of_books = 5
  @approved_books = []
  users.each do |user|
    users_name = "#{user.firstname} #{user.lastname}"
    (1..number_of_books).each do |n|
      @approved_books << create_and_approve_book_for(user,
                                                :isbn => "9999#{n}",
                                                :author => users_name,
                                                :title => "The Autobiography of #{users_name} Vol. #{n}")
    end
  end
end

#user actions

def user_creates_a_book user, book = {author: 'Default Author', title: 'Default Title', isbn: '1234'}
  login_as user
  visit '/books/new'
  fill_in "Author", :with => book[:author]
  fill_in "Title", :with => book[:title]
  fill_in "Isbn", :with => book[:isbn]
  click_button "Create Book"
  logout user
end
