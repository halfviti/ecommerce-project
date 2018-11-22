class ApplicationController < ActionController::Base
  breadcrumb 'Home', :root_path
  before_action :set_layout_variables

  def set_layout_variables
    @categories = Category.all.order(:name)
  end
end
