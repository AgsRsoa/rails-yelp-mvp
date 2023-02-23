class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
     # recuperer mon resto
    @restaurant = Restaurant.find(params[:restaurant_id])
    # l'associer a ma reviews
    @review.restaurant = @restaurant
    # save la review
      if @review.save
          redirect_to restaurant_path(@restaurant)
      else
        render :new, status: :unprocessable_entity
      end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
