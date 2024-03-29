class EvolutionsController < ApplicationController
  def create
    pokemon = Pokemon.find(params[:pokemon_id])
    evolution_form = Pokemons::EvolvePokemonForm.new(pokemon)

    if evolution_form.save
      redirect_to pokemons_path, notice: "Pokemon successfully evolved"
    else
      redirect_to pokemons_path, alert: evolution_form.errors.full_messages
    end
  end
end
