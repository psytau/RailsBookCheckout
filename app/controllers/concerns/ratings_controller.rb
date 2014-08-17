class RatingsController < ApplicationController

  def update
    @rating = Rating.find(params[:id])
    @book = Book.where(Rating.find(params[:id]).book_id).first
    if @rating.update_attributes(score: params[:score])
      respond_to do |format|
        format.js
      end
    end
  end

end