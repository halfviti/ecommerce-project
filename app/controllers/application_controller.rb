# frozen_string_literal: true

class ApplicationController < ActionController::Base
  breadcrumb 'Home', :root_path
  before_action :set_layout_variables
  before_action :initialize_cart
  add_flash_types :added, :updated_quantity, :removed_product

  def set_layout_variables
    @categories = Category.all.order(:name)
  end

  def initialize_cart
    session[:cart] ||= []
  end
end
