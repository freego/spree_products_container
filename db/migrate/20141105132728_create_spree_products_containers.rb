class CreateSpreeProductsContainers < ActiveRecord::Migration
  def self.up
    create_table :spree_products_containers do |t|
      t.string :name
      t.text :description
      t.datetime :start_at
      t.datetime :end_at
      t.boolean :active
      t.string :slug
      t.integer :position
      t.string :type
      t.timestamps
    end

    add_index :spree_products_containers, :slug, unique: true
  end

  def self.down
    drop_table :spree_products_containers
  end
end