class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @products = @category.products.all.page params[:page]
    breadcrumb @category.name, category_path(params[:id])
  end
end
