require 'rails_helper'

RSpec.feature "user views a list of pokemon" do
  scenario "shows a list of pokemon" do
    first_pokemon = Pokemon.create(name: "Charmander", kind: "Fire")
    second_pokemon = Pokemon.create(name: "Bulbasaur", kind: "Grass")

    visit pokemons_path

    expect(page).to have_content("All Pokemons")
    expect(page).to have_content("Name: Charmander")
    expect(page).to have_content("Name: Bulbasaur")
    expect(page).to have_content("Kind: Fire")
    expect(page).to have_content("Kind: Grass")
  end
end
