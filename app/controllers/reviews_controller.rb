class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    # find the right restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
    # create new review
    @review = Review.new(review_params)
    # assign review to right restaurant
    @review.restaurant = @restaurant
    # save it!
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # find the review
    @review = Review.find(params[:id])
    # destroy the review
    @review.destroy
    # redirect to
    redirect_to restaurant_path(@review.restaurant)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
