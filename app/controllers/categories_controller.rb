class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    # @category_size =
    @products = @category.products.order(created_at: :desc)
  end

end