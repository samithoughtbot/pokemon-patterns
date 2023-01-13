Rails.application.routes.draw do
  root "pokemons#index"

  resources :pokemons, only: [:index, :new, :create] do
    resources :evolutions, only: [:create]
  end
end
