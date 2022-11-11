require 'rails_helper'

RSpec.describe Pokemons::CreatePokemonForm, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:kind) }
  end

  describe '#save' do
    it 'saves a pokemon to the database' do
      params = { name: "Charizard", kind: "Fire" }
      create_pokemon_form = Pokemons::CreatePokemonForm.new(params)

      create_pokemon_form.save

      expect(Pokemon.count).to eq(1)
      expect(Pokemon.last.name).to eq("Charizard")
      expect(Pokemon.last.kind).to eq("Fire")
    end
  end
end
