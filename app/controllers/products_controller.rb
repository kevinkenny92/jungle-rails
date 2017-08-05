class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    puts "PRODUCT REVIEWS: #{@product.reviews}"
    @review = @product.reviews.build
  end

end