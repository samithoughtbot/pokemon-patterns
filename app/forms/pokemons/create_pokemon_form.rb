class Pokemons::CreatePokemonForm
  def initialize(params)
    @params = params
  end

  def save
    pokemon = Pokemon.new(@params)
    pokemon.save!
  end
end
