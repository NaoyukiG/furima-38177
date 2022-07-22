class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_product, only: [:show, :edit, :update]

  def index
    @products = Product.all.order(created_at: :DESC)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to root_path unless user_signed_in? && current_user.id == @product.user_id
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product.id)
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :content, :category_id, :status_id, :charge_id, :prefacture_id, :shipping_day_id,
                                    :price, :image).merge(user_id: current_user.id)
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
