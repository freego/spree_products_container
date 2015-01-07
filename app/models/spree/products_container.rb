module Spree
  class ProductsContainer < ActiveRecord::Base
    extend FriendlyId
    friendly_id :slug_candidates, use: [:slugged, :finders]

    has_many :products_container_products, dependent: :destroy
    has_many :products, -> { reorder('spree_products_container_products.id') },
             through: :products_container_products


    has_attached_file :image,
                      styles: { large: '600x600>' },
                      default_style: :large,
                      url: '/spree/products_containers/:id/:style/:basename.:extension',
                      path: ':rails_root/public/spree/products_containers/:id/:style/:basename.:extension',
                      convert_options: { all: '-strip -auto-orient -colorspace sRGB' }

    validates_attachment :image, content_type: { content_type: /\Aimage\/.*\Z/ }

    default_scope { order(:position) }

    def slug_candidates
      [:name]
    end
  end
end