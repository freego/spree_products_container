class Spree::ProductsContainerProduct < ActiveRecord::Base
  belongs_to :products_container
  belongs_to :product
end
