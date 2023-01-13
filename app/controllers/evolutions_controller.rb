class EvolutionsController < ApplicationController
  def create
    pokemon = Pokemon.find(params[:pokemon_id])
    
    if pokemon.increment(:evolution).save
      redirect_to pokemons_path, notice: "Pokemon successfully evolved"
    else
      redirect_to pokemons_path, alert: "Something went wrong"
    end
  end
end
