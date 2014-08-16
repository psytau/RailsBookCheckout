module ApplicationHelper
  def new_review_for_book_path book
    new_book_review_path({:book_id => @book.id})
  end

end
