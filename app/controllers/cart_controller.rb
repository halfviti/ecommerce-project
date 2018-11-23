# frozen_string_literal: true

class CartController < ApplicationController
  before_action :define_quantity, only: [:add_product, :update_quantity]
  before_action :define_id, only: [:add_product, :remove_product, :update_quantity]
  before_action :set_return, only: [:add_product, :remove_product, :update_quantity]

  def index
    @cart = session[:cart].map do |x|
      {product: Product.find(x['product_id']),
       quantity: x['quantity']}
    end
  end

  def add_product
    if session[:cart].none? { |x| x['product_id'].to_i == @id }
      session[:cart] << { product_id: @id, quantity: @quantity }
    else
      session[:cart].find { |x| x['product_id'] == @id }['quantity'] += @quantity
    end
    redirect_to session.delete(:return_to)
  end

  def remove_product
    session[:cart].delete_if { |x| x['product_id'] == @id }
    redirect_to session.delete(:return_to)
  end

  def update_quantity
    session[:return_to] ||= request.referer
    session[:cart].find { |x| x['product_id'] == @id }['quantity'] = @quantity
    redirect_to session.delete(:return_to)
  end

  def define_id
    @id = params[:product_id].to_i
  end

  def define_quantity
    @quantity = params[:quantity].to_i
  end

  def set_return
    session[:return_to] ||= request.referer
  end
end
