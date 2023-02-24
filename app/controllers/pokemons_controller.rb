class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all.order(:name)
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

  def destroy
    @pokemon = Pokemon.find(params[:id])
    if @pokemon.present?
      @pokemon.destroy
      redirect_to root_path
    else
      flash[:notice] = "No pokemon available"
    end
  end

  private
  
  def pokemon_params
    params.require(:pokemons_create_pokemon_form).permit(:name, :kind)
  end
end
