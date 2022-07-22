class DestinationsController < ApplicationController

  def index
    @product = Product.find(params[:format])
  end

end
