require 'rails_helper'


feature "Follow" do

  before(:each) do
    @user = FactoryGirl.create :user
    @book = FactoryGirl.create :book
    @book.user = @user
    @book.save!
    login_as(@user, :scope => :user)
  end

  scenario "User follows a book" do
    visit book_path @book
    click_link 'Follow'

    follower = Follower.where("user_id = ? and book_id = ?", @user.id, @book.id).first
    expect(follower.id).to eq(@user.id)
  end

  scenario "User follows a book and others review that book" do
    visit book_path @book
    click_link 'Follow'
    user2 = FactoryGirl.create :user
    login_as(user2, :scope => :user)
    visit book_path @book

    fill_in "book_review_content",
             :with => "This is a heartbreaking tale of breathtaking beauty."
    click_button "Create Book review"
    expect(page).to have_text("a heartbreaking tale")

    messages = Message.where('user_id = ?', @user.id)
    m = messages.first
    expect(m.user_id).to eq(@user.id)
    expect(m.book_id).to eq(@book.id)
    expect(m.kind).to eq(:book_review)

    login_as(@user, :scope => :user)

    # now your message path should have a message about user2
    # leaving a book review for @book
    visit '/me/messages'
    expect(page).to have_text(user2.firstname)
    expect(page).to have_text(@book.title)
  end


end
