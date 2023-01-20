class Pokemons::EvolvePokemonForm
  include ActiveModel::Model

  def initialize(pokemon)
    @pokemon = pokemon
  end

  validate :reached_evolution_limit

  def save
    return false if invalid?

    @pokemon.increment(:evolution).save
  end

  private

  def reached_evolution_limit
    if @pokemon.evolution >= 3
      errors.add(:evolution, "this pokemon has reached their evolution limit")
    end
  end
end