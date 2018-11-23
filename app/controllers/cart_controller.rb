# frozen_string_literal: true

class CartController < ApplicationController
  before_action :define_quantity, only: %i[add_product update_quantity]
  before_action :get_product, only: %i[add_product remove_product update_quantity]
  before_action :set_return, only: %i[add_product remove_product update_quantity]

  def index
    @cart = session[:cart].map do |x|
      { product: Product.find(x['product_id']),
        quantity: x['quantity'] }
    end
  end

  def add_product
    if session[:cart].none? { |x| x['product_id'].to_i == @product.id }
      session[:cart] << { product_id: @product.id, quantity: @quantity }
    else
      session[:cart].find { |x| x['product_id'] == @product.id }['quantity'] += @quantity
    end
    redirect_to session.delete(:return_to),
                added: "#{@product.name} has been added to Cart."
  end

  def remove_product
    session[:cart].delete_if { |x| x['product_id'] == @product.id }
    redirect_to session.delete(:return_to),
                removed_product: "#{@product.name} removed from Cart."
  end

  def update_quantity
    session[:return_to] ||= request.referer
    session[:cart].find { |x| x['product_id'] == @product.id }['quantity'] = @quantity
    redirect_to session.delete(:return_to),
                updated_quantity: "Updated product quantity: #{@product.name}"
  end

  def get_product
    @product = Product.find(params[:product_id].to_i)
  end

  def define_quantity
    @quantity = params[:quantity].to_i
  end

  def set_return
    session[:return_to] ||= request.referer
  end
end
