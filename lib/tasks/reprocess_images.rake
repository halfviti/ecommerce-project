namespace :images do
  desc "Reprocess all image versions"
  task reprocess: :environment do
    Product.all.each do |product|
      product.image.recreate_versions!
    end
  end
end