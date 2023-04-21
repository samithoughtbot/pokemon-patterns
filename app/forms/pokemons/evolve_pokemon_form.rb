class Pokemons::EvolvePokemonForm
  include ActiveModel::Model

  def initialize(pokemon)
    @pokemon = pokemon
  end

  validate :reached_evolution_limit

  def save
    return false if invalid?

    pokemon.name = pokemon.evolves_into
    pokemon.save!
  end

  private

  attr_reader :pokemon

  def reached_evolution_limit
    if pokemon.reached_final_stage?
      errors.add(:base, "this pokemon has reached their evolution limit")
    end
  end
end