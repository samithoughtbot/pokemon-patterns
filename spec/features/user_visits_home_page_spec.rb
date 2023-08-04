require "rails_helper"

RSpec.feature "user visits home page" do
  scenario "allows user to navigate to pokemon page" do
    visit home_index_path

    expect(page).to have_content("Welcome to Pokemon Patterns")
    expect(page).to have_link("Pokemon")
  end

  context "when the user is signed in" do
    scenario "allows the user to sign out" do
      user = User.create!(email: "test@example.com", password: "123")

      visit home_index_path(as: user)

      expect(page).to have_button("Sign out")
    end
  end

  context "when the user is signed out" do
    scenario "allows the user to sign in" do
      visit home_index_path

      expect(page).to have_link("Sign in")
    end
  end
end
