class Product < ApplicationRecord
  belongs_to :category, optional: true
  mount_uploader :image, ImageUploader
end
