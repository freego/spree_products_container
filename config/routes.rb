Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :products_containers do
      collection do
        post :update_positions
      end
    end
  end

  namespace :api, defaults: { format: 'json' } do
    resources :products_containers, only: [] do
      get :products
    end
  end
end
