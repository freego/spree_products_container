module SpreeProductsContainer
  class ResourceGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('../templates', __FILE__)

    argument :name, type: :string, default: '', banner: 'resource_name'

    def create_model
      template 'model.rb', "app/models/spree/#{singular_name}.rb"
    end

    def create_controller
      template 'controller.rb', "app/controllers/spree/admin/#{plural_name}_controller.rb"
    end

    def create_override
      template 'override.html.erb.deface', "app/overrides/spree/layouts/admin/add_spree_#{plural_name}.html.erb.deface"
    end

    def create_routes
      append_file 'config/routes.rb', routes_text
    end

    def create_locale
      %w(en it).each do |locale|
        template "locales/#{locale}.yml", "config/locales/#{plural_name}.#{locale}.yml"
      end
    end

    private

    def routes_text
<<-eos

Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :#{plural_name} do
      collection do
        post :update_positions
      end
    end
  end
end
eos
    end
  end
end
