class DestinationsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_product, only: [:index, :create]

  def index
    @destination_purchase = DestinationPurchase.new
    if current_user.id == @product.user_id
      redirect_to root_path
    elsif @product.purchase_management.present?
      redirect_to root_path
    end
  end

  def create
    @destination_purchase = DestinationPurchase.new(destination_purchase_params)
    if @destination_purchase.valid?
      pay_product
      @destination_purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def destination_purchase_params
    params.require(:destination_purchase).permit(
      :postal_code, :prefacture_id, :city, :house_number, :building_name, :telephone_number
    ).merge(
      user_id: current_user.id, product_id: params[:product_id], token: params[:token]
    )
  end

  def pay_product
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product.price,
      card: destination_purchase_params[:token],
      currency: 'jpy'
    )
  end

  def find_product
    @product = Product.find(params[:product_id])
  end
end
