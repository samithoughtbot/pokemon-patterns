require 'rails_helper'

RSpec.describe Pokemons::CreatePokemonForm, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:kind) }

    it 'is one of the original 150 pokemon' do
      pokemon = instance_double(
        Pokemon, 
        is_original_150?: false,
        evolution_stage: 1
      )
      allow(Pokemon).to receive(:new).and_return(pokemon)
      params = { name: "Pingu", kind: "Fire" }
      create_pokemon_form = Pokemons::CreatePokemonForm.new(params)

      create_pokemon_form.save
      
      expect(
        create_pokemon_form.errors[:name]
      ).to eq(["must be one of the original 150 pokemon"])
    end

    it 'is at stage 1 of evolvution' do
      pokemon = instance_double(
        Pokemon, 
        is_original_150?: true,
        evolution_stage: 2
      )
      allow(Pokemon).to receive(:new).and_return(pokemon)
      params = { name: "Charizard", kind: "Fire" }
      create_pokemon_form = Pokemons::CreatePokemonForm.new(params)

      create_pokemon_form.save
      
      expect(
        create_pokemon_form.errors[:name]
      ).to eq(["you can only create a pokemon at stage 1 of evolution"])
    end
  end

  describe '#save' do
    it 'saves a pokemon to the database' do
      params = { name: "Charmander", kind: "Fire" }
      create_pokemon_form = Pokemons::CreatePokemonForm.new(params)

      create_pokemon_form.save

      expect(Pokemon.count).to eq(1)
      expect(Pokemon.last.name).to eq("Charmander")
      expect(Pokemon.last.kind).to eq("Fire")
    end
  end
end
