Rails.application.routes.draw do
  root "home#index"

  resources :home, only: [:index]

  resources :pokemons, only: [:index, :new, :create] do
    resources :evolutions, only: [:create]
  end
end
