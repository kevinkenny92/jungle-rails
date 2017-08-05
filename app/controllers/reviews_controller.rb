class ReviewsController < ApplicationController

  before_filter :authenticate_user

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.product_id = params[:product_id].to_s

    if @review.save!
      redirect_to :products, url: params[:product_id].to_s
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