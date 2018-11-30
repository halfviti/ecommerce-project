# frozen_string_literal: true

class ApplicationController < ActionController::Base
  breadcrumb 'Home', :root_path
  before_action :set_layout_variables
  before_action :initialize_session
  add_flash_types :success, :danger

  def set_layout_variables
    @categories = Category.all.order(:name)
  end

  def initialize_session
    session[:cart] ||= []
    session[:order] ||= []
  end
end
