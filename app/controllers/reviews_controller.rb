class ReviewsController < ApplicationController

  before_filter :authenticate_user

  def authenticate_user
    redirect_to login_path, notice: 'Sorry! You must be logged in to write a review.' unless current_user
  end

  def destroy
    @review = Review.find_by(id: params[:id])
    @review.destroy
    redirect_to :back, notice: 'Review deleted!'
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.product_id = params[:product_id].to_s

    if @review.save!
      redirect_to :back
    else
      render 'ratings'
    end
  end

  private

  def review_params
    params.require(:review).permit(
      :rating,
      :description
    )
  end

end