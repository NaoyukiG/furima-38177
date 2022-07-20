class ProductsController < ApplicationController

  def index
  end

  def new
    @products = Product.new
  end

  def create

  end

  private
  def product_params
    params.require(:Product).permit(:title, :content, :category_id, :status_id, :charge_id, :prefacture_id, :shipping_day_id, :price, :image).merge(user_id: :current_user.id)
  end
end
