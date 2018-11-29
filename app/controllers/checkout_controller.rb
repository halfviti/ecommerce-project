class CheckoutController < ApplicationController
  def index
    @order = helpers.read_cart
  end

  def confirmation
    session[:cart] = []
  end
end
