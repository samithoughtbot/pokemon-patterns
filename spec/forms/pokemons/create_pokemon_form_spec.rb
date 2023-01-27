require 'rails_helper'

RSpec.describe Pokemons::CreatePokemonForm, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:kind) }

    it 'is one of the original 150 pokemon' do
      stub_const("OriginalPokemon::NAMES", ["Charizard", "Mew"])
      # pokemon = instance_double(
      #   Pokemon, 
      #   is_original_150?: false)
      params = { name: "Pingu", kind: "Fire" }
      # allow(pokemon).to receive(:is_original_150?).and_return(false)
      # allow_any_instance_of(Pokemon).to receive(:is_original_150?).and_return(false)
      create_pokemon_form = Pokemons::CreatePokemonForm.new(params)

      create_pokemon_form.save
      
      expect(
        create_pokemon_form.errors[:name]
      ).to eq(["must be one of the original 150 pokemon"])
    end
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
