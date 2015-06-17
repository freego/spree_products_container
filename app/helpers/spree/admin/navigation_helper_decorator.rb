module Spree
  module Admin
    NavigationHelper.module_eval do

      def link_to_preview(resource, options={})
        begin
          url = options[:url] || url_for(resource)
          options[:data] = { action: "preview" }
          options[:class] = "btn btn-primary btn-sm"
          options[:target] = "_blank"
          link_to_with_icon("eye-open", Spree.t(:preview), url, options)
        # object may not have frontend show route
        rescue
          nil
        end
      end

    end
  end
end