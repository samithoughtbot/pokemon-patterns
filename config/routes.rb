Rails.application.routes.draw do
  root "home#index"

  resources :home, only: [:index]

  resources :pokemons, only: [:index, :new, :create] do
    resources :evolutions, only: [:create]
  end

  ### clearance ###
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", :as => "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", :as => "sign_out"
  get "/sign_up" => "clearance/users#new", :as => "sign_up"

  ### ###
end
