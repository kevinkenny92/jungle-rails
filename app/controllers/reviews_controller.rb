class ReviewsController < ApplicationController

  def create
    # raise "Yay, I'm here!"
    @review = Review.new(review_params)
    @review.user = current_user
    @rewiew.product_id = [product_id: product.id]

    if @review.save
      redirect_to [:product],
      notice: 'Review created sucessfully!'
    else
      render root_path
    end
  end

  def review_params
    params.require(:review).permit(
      :rating,
      :description
    )
  end

end