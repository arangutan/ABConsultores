Rails.application.routes.draw do

  
  get 'usuarios/new'

  get 'usuarios/index'

  post 'ususarios/create' , to:  'usuarios#create' , as: 'usuarios'

  put 'usuarios/:id', to: 'usuarios#update', as: 'usuarios/update'

  get 'usuarios/:id/edit' , to: 'usuarios#edit' , as: 'usuarios/edit'

  delete 'usuarios/:id', to: 'usuarios#destroy' , as: 'usuarios/destroy'

  # get 'users/new'

  # post 'users' , to:  'users#create' , as: 'users'

  # put 'users/:id', to: 'users#update', as: 'users/update'

  # get 'users/:id/edit' , to: 'users#edit' , as: 'users/edit'

  # delete 'users/:id', to: 'user#destroy' , as: 'user/destroy'

  #get 'users/show'

  #get 'users/index'

  #resources :users, controller: 'users'

  resources :influences

  resources :influencestakeholders

  resources :relevances

  resources :relevancestakeholders

  resources :interests

  resources :compromises

  resources :entities

  resources :temasregulatorios

  resources :mettings

  resources :stakeholders

  get 'welcome/index'

  devise_for :users
  resources :empresas

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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