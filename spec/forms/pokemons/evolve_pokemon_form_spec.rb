require 'rails_helper'

RSpec.describe Pokemons::EvolvePokemonForm do
  describe 'validations' do
    it 'does not evolve a pokemon past level 3' do
      pokemon = Pokemon.create(name: "Charizard", kind: "Fire", evolution: 3)
      evolve_pokemon_form = Pokemons::EvolvePokemonForm.new(pokemon)

      evolve_pokemon_form.save

      expect(
        evolve_pokemon_form.errors[:evolution]
      ).to eq(["this pokemon has reached their evolution limit"])
    end  
  end

  describe '#save' do
    it 'evolves a pokemon' do
      pokemon = Pokemon.create(name: "Charmander", kind: "Fire", evolution: 1)
      evolve_pokemon_form = Pokemons::EvolvePokemonForm.new(pokemon)

      evolve_pokemon_form.save

      expect(pokemon.reload.evolution).to eq(2)
    end
  end
end
