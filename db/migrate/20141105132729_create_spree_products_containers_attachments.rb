class CreateSpreeProductsContainersAttachments < ActiveRecord::Migration
  def self.up
    add_attachment :spree_products_containers, :image
  end

  def self.down
    remove_attachment :spree_products_containers, :image
  end
end