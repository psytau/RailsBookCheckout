
#Setup helpers

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

def populate_books users
  users.each do |user|
    1..10.each do |n|
      create_and_approve_book_for user, :author => user.email, :title => "The Autobiography of #{user.email} Vol. #{n}"
    end
  end
end

#user actions
