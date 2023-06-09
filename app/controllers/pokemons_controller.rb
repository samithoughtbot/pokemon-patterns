class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all.order(:name)
    # @pokemons = PresenterGenerator.generate(active_record_collection)
    # returns an array of presenter objects for the given collection
  end

  def new
    @pokemon_form = Pokemons::CreatePokemonForm.new
  end

  def create
    @pokemon_form = Pokemons::CreatePokemonForm.new(pokemon_params)

    if @pokemon_form.save
      redirect_to pokemons_path, notice: "Pokemon successfully created"
    else
      render 'new'
    end
  end

  private

  def pokemon_params
    params.require(:pokemons_create_pokemon_form).permit(:name, :kind)
  end
end
