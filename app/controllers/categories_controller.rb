class CategoriesController < ApplicationController
  def show
    @products = Category.find(params[:id]).products.all.page params[:page]
  end
end
