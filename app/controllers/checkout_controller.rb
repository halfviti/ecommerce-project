class CheckoutController < ApplicationController

  def index
    @title = 'Your Order'
    cart = helpers.read_cart
    @order = Order.create(date: Time.now)
    cart.each do |item|
    OrderProduct.create(order_id: @order.id,
                        product_id: item[:product].id,
                        price: item[:product].price,
                        quantity: item[:quantity])
    session[:order] = @order.id
    end
  end

  def confirmation
    if session[:order].blank?
      redirect_to root_path,
                  danger: 'Cannot confirm empty order.'
    end
    Order.find(session[:order]).confirm
    session[:cart] = []
    session[:order] = []
    redirect_to root_path,
                success: 'Order confirmed.'
  end
end
