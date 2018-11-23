# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    breadcrumb 'Products', :products_path
    if params[:filter].present?
      if params[:filter] == 'new'
        @products = Product.where('created_at > ?', 7.days.ago)
                           .order(created_at: :desc)
      end
      if params[:filter] == 'updated'
        @products = Product.where('updated_at > ?', 7.days.ago)
                           .order(updated_at: :desc)
      end
    else
      @products = Product.all
    end
    @products = @products&.page params[:page]
  end

  def show
    @product = Product.find(params[:id])
    breadcrumb @product.category.name, category_path(@product.category_id)
    breadcrumb @product.name, product_path(params[:id])
  end
end
