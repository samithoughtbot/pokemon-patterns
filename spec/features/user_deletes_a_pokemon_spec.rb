require 'rails_helper'

RSpec.feature "user deletes a pokemon" do
  scenario "deletes a pokemon" do
    pokemon = Pokemon.create(name: 'Pikachu', kind: 'Electric')

    visit pokemons_path
    click_button "Delete Pokemon"

    expect(page).not_to have_content("Pikachu")
    expect(page).not_to have_content("Electric")
  end
end