class BookReviewsController < ApplicationController
  #before_action :set_book_review, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /book_reviews
  # GET /book_reviews.json
  def index
    @book_reviews = BookReview.all
  end

  # GET /book_reviews/1
  # GET /book_reviews/1.json
  def show
  end

  # GET /book_reviews/new
  def new
    @book_review = BookReview.new
    if params[:book_id] =~ /^\d+$/
      @book_id = params[:book_id]
    else
      # TODO: gracefully error out
      fail
    end

  end

  # GET /book_reviews/1/edit
  def edit
  end

  # POST /book_reviews
  # POST /book_reviews.json
  def create
    @book_review = BookReview.new(book_review_params)
    @book_review.user = current_user

    respond_to do |format|
      if @book_review.save
        format.html { redirect_to @book_review, notice: 'Book review was successfully created.' }
        format.js { render :show}
      else
        format.html { render :new }
        format.json { render json: @book_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # We don't allow users to update reviews as of yet.
  # PATCH/PUT /book_reviews/1
  # PATCH/PUT /book_reviews/1.json
  # def update
  #   respond_to do |format|
  #     if @book_review.update(book_review_params)
  #       format.html { redirect_to @book_review, notice: 'Book review was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @book_review }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @book_review.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /book_reviews/1
  # DELETE /book_reviews/1.json
  def destroy
    @book_review.destroy
    respond_to do |format|
      format.html { redirect_to book_reviews_url, notice: 'Book review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_review
      @book_review = BookReview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_review_params
      params.require(:book_review).permit(:content, :book_id)
    end
end
