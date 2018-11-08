ActiveAdmin.register Product do
  permit_params :name, :category_id, :description, :price, :image
end