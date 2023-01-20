require 'rails_helper'

RSpec.describe OriginalPokemon do
  describe '::NAMES' do
    it 'returns the array of pokemon names' do
      stub_const("OriginalPokemon::NAMES", ["Charizard", "Mew"])
      expect(OriginalPokemon::NAMES).to eq(["Charizard", "Mew"])
    end
  end
end