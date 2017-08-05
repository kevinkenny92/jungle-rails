##ADMIN SEC##

class Admin::ProductsController < ApplicationController

 http_basic_authenticate_with name: ENV['admin_name'], password: ENV['admin_password']

  def index
    @products = Product.order(id: :desc).all
  end

  def new
    @product = Product.new
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    redirect_to :back, notice: 'Product deleted!'
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to [:admin, :products], notice: 'Product created!'
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :category_id,
      :quantity,
      :image,
      :price
    )
  end

end