module Page
  class PokemonNewPage
    include Rails.application.routes.url_helpers
    include Capybara::DSL
    include Formulaic::Dsl

    def navigate_to
      visit pokemons_path
      click_link "Create new pokemon"
    end

    def submit_valid_form_data(name:, kind:)
      fill_form_and_submit(
        :pokemon,
        :new,
        name: name,
        kind: kind
      )
    end
  end
end
