namespace :reprocess_images do
  Product.all.each do |product|
    product.image.recreate_versions!
  end
end
