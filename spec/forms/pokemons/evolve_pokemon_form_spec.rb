require 'rails_helper'

RSpec.describe Pokemons::EvolvePokemonForm do
  describe 'validations' do
    it 'does not evolve a pokemon past its final stage' do
      pokemon = Pokemon.create(name: "Charizard", kind: "Fire")
      allow(pokemon).to receive(:reached_final_stage?).and_return(true)
      evolve_pokemon_form = Pokemons::EvolvePokemonForm.new(pokemon)

      evolve_pokemon_form.save

      expect(
        evolve_pokemon_form.errors[:base]
      ).to eq(["this pokemon has reached their evolution limit"])
    end  
  end

  describe '#save' do
    it 'evolves a pokemon' do
      pokemon = Pokemon.create(name: "Charmander", kind: "Fire")
      allow(pokemon).to receive(:evolves_into).and_return("Charmeleon")
      evolve_pokemon_form = Pokemons::EvolvePokemonForm.new(pokemon)

      evolve_pokemon_form.save

      expect(pokemon.reload.name).to eq("Charmeleon")
    end
  end
end
