module Spree
  module Admin
    class <%= class_name.pluralize %>Controller < ProductsContainersController
      def index
        @objects = Spree::<%= class_name %>.page(params[:page] || 1).per(50)
      end
    end
  end
end
