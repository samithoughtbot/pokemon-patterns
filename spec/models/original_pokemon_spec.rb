require 'rails_helper'

RSpec.describe OriginalPokemon do
  describe '#is_original_150?' do
    context "when the pokemon is in the original 150" do
      it 'returns true' do
        stub_const("OriginalPokemon::NAMES", ["Charizard", "Mew"])
        pokemon = Pokemon.new(name: "Mew", kind: "Fire")
        
        expect(pokemon.is_original_150?).to eq true
      end
    end

    context "when the pokemon is not in the original 150" do
      it 'returns false' do
        stub_const("OriginalPokemon::NAMES", ["Charizard", "Mew"])
        pokemon = Pokemon.new(name: "Pingu", kind: "Fire")
        
        expect(pokemon.is_original_150?).to eq false
      end
    end
  end
end