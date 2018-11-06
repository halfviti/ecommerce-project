ActiveAdmin.register Category do
  permit_params :name, products: []
end
