require 'rails_helper'

RSpec.feature "user creates a pokemon" do
  scenario "adds a new pokemon to the index" do
    visit pokemons_path
    click_link "Create new pokemon"

    fill_form_and_submit(
      :pokemon,
      :new,
      name: "Charmander",
      kind: "Fire"
    )

    expect(page).to have_content("Pokemon successfully created")
    expect(page).to have_content("All Pokemons")
    expect(page).to have_content("CHARMANDER")
    expect(page).to have_content("Fire")
  end
end
