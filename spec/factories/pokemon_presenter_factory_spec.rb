require 'rails_helper'

RSpec.describe PokemonPresenterFactory do
  describe '.build' do
    it 'builds presenter objects for every object in an ActiveRecord collection' do
      pokemon_one = Pokemon.create(name: "Charmander", kind: "Fire")
      pokemon_two = Pokemon.create(name: "Pikachu", kind: "Electric")
      active_record_collection = Pokemon.all

      result = PokemonPresenterFactory.build(active_record_collection)

      expect(result).to be_an(Array)
      expect(result).to all(be_a(PokemonPresenter))
    end
  end
end
