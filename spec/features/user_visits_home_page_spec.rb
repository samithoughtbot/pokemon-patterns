require "rails_helper"

RSpec.feature "user visits home page" do
  scenario "allows user to navigate to pokemon page" do
    visit home_index_path

    expect(page).to have_content("Welcome to Pokemon Patterns")
    expect(page).to have_link("Pokemon")
  end
end
