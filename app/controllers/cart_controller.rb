class CartController < ApplicationController
  def index
  end

  def add_product
    session[:return_to] ||= request.referer

    id = params[:product_id].to_i
    quantity = params[:quantity].to_i
    if session[:cart].none? { |x| x['product_id'].to_i == id }
      session[:cart] << { product_id: id, quantity: quantity }
    else
      session[:cart].find{ |x| x['product_id'] == id }['quantity'] += quantity
    end
    redirect_to session.delete(:return_to)
  end
end
