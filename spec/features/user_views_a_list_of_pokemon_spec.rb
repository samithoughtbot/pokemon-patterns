require 'rails_helper'

RSpec.feature "user views a list of pokemon" do
  scenario "shows a list of pokemon" do
    first_pokemon = Pokemon.create(name: "Charmander", kind: "Fire")
    second_pokemon = Pokemon.create(name: "Bulbasaur", kind: "Grass")

    visit pokemons_path

    expect(page).to have_content("All Pokemons")
    expect(page).to have_content("Charmander")
    expect(page).to have_content("Bulbasaur")
    expect(page).to have_content("Fire")
    expect(page).to have_content("Grass")
  end
end
