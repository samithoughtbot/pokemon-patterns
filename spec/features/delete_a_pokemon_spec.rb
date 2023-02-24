require 'rails_helper'

RSpec.feature "user delete a pokemon" do
  scenario "delete a pokemon when clicks the delete button" do
    first_pokemon = Pokemon.create(name: "Charmander", kind: "Fire", evolution: 1)
    visit pokemons_path
    
    click_button "Delete"

    expect(page).to have_content("No pokemon available")
    expect(page).to_not have_content("Charmander")
  end
end
