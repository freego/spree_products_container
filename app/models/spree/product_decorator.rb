Spree::Product.class_eval do
  has_many :products_container_products
  has_many :products_containers, through: :products_container_products
end