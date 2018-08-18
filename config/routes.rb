Rails.application.routes.draw do
  root 'posts#index'
  resources :posts do
    post "/like", to:"likes#like_toggle", defaults: { format: 'js' }
    resources :comments, only: [:create, :destroy], defaults: { format: 'js' }
    collection do
      get :search, defaults: { format: 'js' }
      get :search_post, defaults: { format: 'js' }
    end
    member do
      get :autoinit, defaults: { format: 'js' }
      get :cancel, defaults: { format: 'js' }
      get :by_song
    end
  end
  resources :timelines, only: [:index] do
    collection do
      get :saves
    end
    member do
      get :profile
      get :subscribe
    end
  end
  resources :follows, only: [:create] do
    member do
      post :toggle, defaults: { format: 'js' }
    end
  end
  resources :alarms, only: [:index]
  resources :alarms, only: [:destroy], defaults: { format: 'js' }

  post '/tinymce_assets' => 'tinymce_assets#create'
  get '/copyurl/:id' => 'copys#copy', defaults: { format: 'js' }, :as => '/copyurl'
  get '/timelines/tag/:name' => 'timelines#tag'

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
