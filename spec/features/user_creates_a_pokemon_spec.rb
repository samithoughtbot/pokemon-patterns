require "rails_helper"

RSpec.feature "user creates a pokemon" do
  scenario "adds a new pokemon to the index" do
    pokemon_new_page = Page::PokemonNewPage.new
    pokemon_index_page = Page::PokemonIndexPage.new
    pokemon_new_page.navigate_to

    pokemon_new_page.submit_valid_form_data(
      name: "Charmander",
      kind: "Fire"
    )

    expect(pokemon_index_page).to be_successfully_created
    expect(pokemon_index_page).to have_displayed_pokemon(
      name: "CHARMANDER",
      kind: "Fire"
    )
  end
end
