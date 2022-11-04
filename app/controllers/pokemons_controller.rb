class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    @form = Pokemons::CreatePokemonForm.new(pokemon_params)

    if @form.save
      redirect_to pokemons_path, notice: "Pokemon successfully created"
    else
      render 'new'
    end
  end

  private
  
  def pokemon_params
    params.require(:pokemon).permit(:name, :kind)
  end
end
