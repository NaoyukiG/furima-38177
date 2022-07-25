class DestinationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @product = Product.find(params[:format])
  end

  def create
  end

  private

  def purchase_management_params
    params.require(:purchase_management).merge(user_id: current_user.id, product_id: @product.id)
  end

  def destination_params
    params.require(:destination).permit(:postal_code, :prefacture_id, :city, :house_number, :building_name, :telephone_number).merge(purchase_management_id: @purchase_management.id)
  end

end
