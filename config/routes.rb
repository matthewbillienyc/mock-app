Rails.application.routes.draw do

  root 'application#index'
  get '/users' => 'users#index'
  get '/users/new' => 'users#new', as: :register
  post'/users' => 'users#create'
  put '/users/:id' => 'users#update'
  get '/users/:id' => 'users#show', as: :show_user
  get '/users/:id/edit' => 'users#edit', as: :edit_user

  post '/logon' => 'session#create'
  get '/logon' => 'session#new', as: :logon_page
  get '/logout' => 'session#destroy', as: :logout

  get '/popsicles' => 'popsicles#index', as: :popsicles
  get '/popsicles/:serial_number' => 'popsicles#show', as: :popsicle
  post '/rate_popsicle' => 'popsicles#rate', as: :rate_popsicle

  get '/accounts/:id' => 'accounts#show', as: :show_account

  post '/notes' => 'notes#create', as: :new_note
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
