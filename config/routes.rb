Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'application#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  get '/people/members', to: 'people#members'
  get '/people/members/current', to: 'people#current_members'
  match '/people/a-z/:letter', to: 'people#letters', letter: /[a-z]/, via: [:get]
  match '/people/members/a-z/:letter', to: 'people#members_letters', letter: /[a-z]/, via: [:get]
  match '/people/members/current/a-z/:letter', to: 'people#current_members_letters', letter: /[a-z]/, via: [:get]

  get '/parties/current', to: 'parties#current'
  match '/parties/a-z/:letter', to: 'parties#letters', letter: /[a-z]/, via: [:get]

  get '/constituencies/current', to: 'constituencies#current'
  match '/constituencies/a-z/:letter', to: 'constituencies#letters', letter: /[a-z]/, via: [:get]
  match '/constituencies/current/a-z/:letter', to: 'constituencies#current_letters', letter: /[a-z]/, via: [:get]

  resources :people, only: [:index, :show] do
    get '/contact_points', to: 'people#contact_points'
    get '/parties', to: 'people#parties'
    get '/parties/current', to: 'people#current_parties'
    get '/constituencies', to: 'people#constituencies'
  end

  resources :parties, only: [:index, :show] do
    get '/members', to: 'parties#members'
    get '/members/current', to: 'parties#current_members'
    match '/members/a-z/:letter', to: 'parties#members_letters', letter: /[a-z]/, via: [:get]
    match '/members/current/a-z/:letter', to: 'parties#current_members_letters', letter: /[a-z]/, via: [:get]
  end

  resources :contact_points, only: [:index, :show]

  resources :constituencies, only: [:index, :show] do
    get '/map', to: 'constituencies#map'
    get '/members', to: 'constituencies#members'
    get '/members/current', to: 'constituencies#current_members'
    get '/contact_point', to: 'constituencies#contact_point'
  end

  resources :houses, only: [:index, :show] do
    get '/members', to: 'houses#members'
    get '/members/current', to: 'houses#current_members'
    get '/parties', to: 'houses#parties'
    get '/parties/current', to: 'houses#current_parties'
    match '/members/a-z/:letter', to: 'houses#members_letters', letter: /[a-z]/, via: [:get]
    match '/members/current/a-z/:letter', to: 'houses#current_members_letters', letter: /[a-z]/, via: [:get]
  end


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
