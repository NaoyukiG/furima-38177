class DestinationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @product = Product.find(params[:format])
  end

end
