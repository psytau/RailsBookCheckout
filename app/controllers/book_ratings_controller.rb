class BookRatingsController < ApplicationController
  before_action :set_book_rating, only: [:show, :edit, :update, :destroy]
  def index
    @book_ratings = BookRating.all
  end

  def new
    @book_rating = BookRating.new
    if params[:book_id] =~ /^\d+$/
      @book_id = params[:book_id]
    else
      # TODO: gracefully error out
      fail
    end
  end

  def create
    @book_rating = BookRating.new(book_rating_params)
    @book_rating.user = current_user

    respond_to do |format|
      if @book_rating.save
        format.json {render json: @book_rating}
      else
        format.json { render json: @book_rating.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_book_rating
      @book_rating = BookRating.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def book_rating_params
      params.require(:book_rating).permit(:rating, :book_id)
    end
end
