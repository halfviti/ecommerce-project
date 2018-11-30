# frozen_string_literal: true

class PagesController < ApplicationController
  def index
    @title = 'Welcome!'
    @featured = Product.limit(3)
  end

  def permalink
    @page = Page.find_by(permalink: params[:permalink])
    @title = @page.title
    if @page.nil?
      redirect_to root_url
    else
      render :show
    end
  end

  def search
    @title = 'Search Results'
    if params[:query_by][:category_id].present?
      category = Category.find(params[:query_by][:category_id])
      @search_results = category.products
                                .where('name LIKE ?', "%#{params[:query]}%")
    else
      @search_results = Product.where('name LIKE ?', "%#{params[:query]}%")
    end

    @search_results = @search_results.order(:name)
                                     .page params[:page]
  end
end
