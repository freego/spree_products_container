class CreateSpreeProductsContainerProducts < ActiveRecord::Migration
  def change
    create_table :spree_products_container_products do |t|
      t.references :products_container
      t.references :product

      t.timestamps
    end

    add_index :spree_products_container_products, :products_container_id, name: 'products_container_products_on_container'
    add_index :spree_products_container_products, :product_id, name: 'products_container_products_on_product'
  end
end
