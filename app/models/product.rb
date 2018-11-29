class Product < ApplicationRecord
  belongs_to :category, optional: true
  has_many :orders, through: :orderproducts
  mount_uploader :image, ImageUploader

  validates :name, uniqueness: true
  validates :name, :description, presence: true
  validates :price, numericality: { greater_than: 0}
end
