Rails.application.routes.draw do

  get 'logins/new'

  get 'logins/create'

  devise_for :logins
  root 'application#index'
  get '/users' => 'users#index'
  get '/users/new' => 'users#new', as: :register
  post'/users' => 'users#create'
  put '/users/:id' => 'users#update'
  get '/users/:id' => 'users#show', as: :show_user
  get '/users/:id/edit' => 'users#edit', as: :edit_user

  get '/cases' => 'cases#index'
  get '/cases/:id' => 'cases#show', as: :show_case
  get '/cases/users/:id' => 'cases#all_by_user'
  post '/cases' => 'cases#create', as: :new_case
  put '/cases/:id' => 'cases#update'
  post '/logon' => 'session#create'
  get '/logon' => 'session#new'
  get '/logout' => 'session#destroy'

  get '/popsicles' => 'popsicles#index'
  get '/popsicles/:id' => 'popsicles#show'

  get '/accounts/:id' => 'accounts#show', as: :show_account
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
