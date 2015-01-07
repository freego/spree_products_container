module Spree
  module Admin
    class ProductsContainersController < ResourceController
      before_action :set_object_name
      before_action :parse_product_ids, only: [:create, :update]

      def index
        @products_containers = Spree::ProductsContainer.page(params[:page] || 1).per(50)
      end

      private

      def set_object_name
        @object_name = object_name
        @objects_name = object_name.pluralize
      end

      def parse_product_ids
        if params[object_name][:product_ids].present?
          params[object_name][:product_ids] = params[object_name][:product_ids].split(',')

          # TODO FIXME
          # will recreate all the associations if something changed
          # quick way to always keep the submitted product sorting
          if @object && params[object_name][:product_ids] != @object.product_ids.map(&:to_s)
            @object.products_container_products.destroy_all
          end
        end
      end
    end
  end
end