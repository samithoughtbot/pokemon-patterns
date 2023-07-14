require "rails_helper"

RSpec.feature "user evolves a pokemon" do
  scenario "evolves a pokemon every time the user clicks the evolve button" do
    Pokemon.create(name: "Charmander", kind: "Fire")
    pokemon_index_page = Page::PokemonIndexPage.new

    pokemon_index_page.visit_page

    pokemon_index_page.click_evolve

    expect(pokemon_index_page).to be_successfully_evolved
    expect(pokemon_index_page).to have_displayed_pokemon(
      name: "CHARMELEON",
      kind: "Fire"
    )

    pokemon_index_page.click_evolve

    expect(pokemon_index_page).to be_successfully_evolved
    expect(pokemon_index_page).to have_displayed_pokemon(
      name: "CHARIZARD",
      kind: "Fire"
    )
  end
end
