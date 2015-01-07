module Spree
  module Api
    class ProductsContainersController < Spree::Api::BaseController

      def products
        object = Spree::ProductsContainer.find(params[:products_container_id].to_i)
        @products = object.products
                     .includes(*product_includes)
                     .page(params[:page])
                     .per(params[:per_page])
      end

    end
  end
end