require "rails_helper"

RSpec.describe PokemonPresenter do
  describe "#uppercase_name" do
    it "converts the name to uppercase" do
      pokemon = instance_double(Pokemon, name: "Mew")
      pokemon_presenter = PokemonPresenter.new(pokemon: pokemon)

      result = pokemon_presenter.uppercase_name

      expect(result).to eq "MEW"
    end
  end
end
