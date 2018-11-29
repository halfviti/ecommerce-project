module CartHelper
  def read_cart
    session[:cart].map do |x|
      { product: Product.find(x['product_id']),
        quantity: x['quantity'] }
    end
  end
end
