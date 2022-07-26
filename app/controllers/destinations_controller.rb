class DestinationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @product = Product.find(params[:format])
  end

  def new
    @destination_purchase = DestinationPurchase.new
  end

  def create
    binding.pry
    @destination_purchase = DestinationPurchase.new(destination_purchase_params)
    if @destination_purchase.valid?
      @destination_purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def destination_purchase_params
    params.require(:destination_purchase).permit(:postal_code, :prefacture_id, :city, :house_number, :building_name, :telephone_number).merge(user_id: current_user.id, product_id: @product.id, purchase_management_id: @purchase_management.id)
  end

end
