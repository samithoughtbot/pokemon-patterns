require 'rails_helper'

RSpec.describe Pokemons::EvolvePokemonForm do
  describe '#save' do
    it 'evolves a pokemon' do
      pokemon = Pokemon.create(name: "Charmander", kind: "Fire", evolution: 1)
      evolve_pokemon_form = Pokemons::EvolvePokemonForm.new(pokemon)

      evolve_pokemon_form.save

      expect(pokemon.reload.evolution).to eq(2)
    end
  end
end
