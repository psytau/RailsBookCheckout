class FollowersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_params

  include SortHelper

  # POST /books
  # POST /books.json
  def new
    @follower = Follower.create!(user_id: @user.id,
                                 book_id: @book.id,
                                 followed_date: Time.now)

    respond_to do |format|
      if @follower.save
        format.html { redirect_to books_path, notice: 'Book has been followed!.' }
      else
        format.html { render :index, error: 'Oh no!  Book could not be followed!.' }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @follower.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book has been unfollowed.' }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_params
    if params[:id]
      @follower = Follower.find(params[:id])
    else
      @book = Book.find(params[:book_id])
      @user = current_user
    end

  end

end
