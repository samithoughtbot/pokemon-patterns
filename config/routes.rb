Rails.application.routes.draw do
  root "pokemons#index"

  resources :pokemons, only: [:index, :new, :create, :destroy] do
    resources :evolutions, only: [:create]
  end
end
