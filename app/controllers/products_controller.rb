class ProductsController < ApplicationController
  
  def index
    breadcrumb 'Products', :products_path
    @products = Product.all.page params[:page]
  end

  def show
    @product = Product.find(params[:id])
    breadcrumb @product.category.name, category_path(@product.category_id)
    breadcrumb @product.name, product_path(params[:id])
  end
end
