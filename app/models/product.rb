class Product < ApplicationRecord
  belongs_to :category, optional: true
  mount_uploader :image, ImageUploader

  validates :name, uniqueness: true
  validates :name, :description, presence: true
  validates :price, numericality: { greater_than: 0}
end
