require 'rails_helper'

RSpec.describe OriginalPokemon do
  describe '#is_original_150?' do
    context "when the pokemon is in the original 150" do
      it 'returns true' do
        stub_const("OriginalPokemon::POKEDEX", [{1 => "Charizard", 2 => "Mew" }])
        pokemon = Pokemon.new(name: "Mew", kind: "Fire")
        
        expect(pokemon.is_original_150?).to eq true
      end
    end

    context "when the pokemon is not in the original 150" do
      it 'returns false' do
        stub_const("OriginalPokemon::POKEDEX", [{1 => "Charizard", 2 => "Mew" }])
        pokemon = Pokemon.new(name: "Pingu", kind: "Fire")
        
        expect(pokemon.is_original_150?).to eq false
      end
    end
  end

  describe '#evolution_stage' do
    it 'returns evolution stage of the pokemon' do
      stub_const("OriginalPokemon::POKEDEX", [{1 => "Charizard", 2 => "Mew" }])
      pokemon = Pokemon.new(name: "Mew", kind: "Fire")
      
      expect(pokemon.evolution_stage).to eq 2
    end
  end

  describe '#evolves_into' do
    it 'returns the name of the pokemon that the given pokemon evolves into' do
      stub_const("OriginalPokemon::POKEDEX", [{1 => "Charmander", 2 => "Charmeleon" }])
      pokemon = Pokemon.new(name: "Charmander", kind: "Fire")

      result = pokemon.evolves_into
      
      expect(result).to eq "Charmeleon"
    end
  end
end