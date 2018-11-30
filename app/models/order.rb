class Order < ApplicationRecord
  has_many :order_products
  has_many :products, through: :order_products
  before_save :default_values
  
  def confirm
    self.status = 'confirmed'
    save
  end

  def default_values
    self.status = status.presence || 'pending'
  end
end
