class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @title = @category.name.pluralize
    @products = @category.products.all.page params[:page]
    breadcrumb @category.name, category_path(params[:id])
  end
end
