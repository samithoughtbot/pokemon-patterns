require "rails_helper"

RSpec.feature "user views a list of pokemon" do
  scenario "shows a list of pokemon" do
    Pokemon.create(name: "Charmander", kind: "Fire")
    Pokemon.create(name: "Bulbasaur", kind: "Grass")
    pokemon_index_page = Page::PokemonIndexPage.new

    pokemon_index_page.visit_page

    expect(pokemon_index_page).to be_visible
    expect(pokemon_index_page).to have_displayed_pokemon(
      name: "CHARMANDER",
      kind: "Fire"
    )
    expect(pokemon_index_page).to have_displayed_pokemon(
      name: "BULBASAUR",
      kind: "Fire"
    )
  end
end
