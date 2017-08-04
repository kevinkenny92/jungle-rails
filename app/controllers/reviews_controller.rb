class ReviewsController < ApplicationController

  def create
    # raise "Yay, I'm here!"
    @review = Review.new(review_params)
    @review.user = current_user

    puts @product.id
    @review.product_id = Product.find params[@product.id]
    puts @review.product_id

    if @review.save
     redirect_to product_path,
      notice: 'Review created sucessfully!'
    else
      redirect_to '/'
    end
  end

  def review_params
    params.require(:review).permit(
      :rating,
      :description
    )
  end

end