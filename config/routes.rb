Rails.application.routes.draw do
  get 'braintree/new'
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]
  resources :listings, controller: "listings" do
    resources :reservations, only: [:index, :create, :new]
  end
  resources :reservations, only: [:show]

  resources :users, controller: "users", only: [:create, :edit] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"

  get 'users/:id', to: 'users#show'
  patch 'users/:id' => 'users#update', as:'update_user'

 get 'listings/:id', to: 'listings#show'


   get "/search" => "listings#search", as: "search"
  
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

##################################################

  get 'posts/new', to: 'posts#new'
  get 'posts/:id', to: 'posts#show'
  post 'posts', to: 'posts#create'

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  patch 'listings/:id/verify' => 'listings#verify', as:'verify'

  post 'braintree/checkout'

end
