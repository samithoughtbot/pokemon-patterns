class Pokemons::EvolvePokemonForm
  def initialize(pokemon)
    @pokemon = pokemon
  end

  def save
    @pokemon.increment(:evolution).save
  end
end