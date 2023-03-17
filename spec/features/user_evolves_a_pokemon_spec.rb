require 'rails_helper'

RSpec.feature "user evolves a pokemon" do
  scenario "evolves a pokemon every time the user clicks the evolve button" do
    first_pokemon = Pokemon.create(name: "Charmander", kind: "Fire")
    visit pokemons_path
    
    click_button "Evolve"
    
    expect(page).to have_content("Pokemon successfully evolved")
    expect(page).to have_content("Name: Charmeleon")

    click_button "Evolve"
    
    expect(page).to have_content("Pokemon successfully evolved")
    expect(page).to have_content("Name: Charizard")
  end
end
