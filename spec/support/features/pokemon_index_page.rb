module Page
  class PokemonIndexPage
    include Rails.application.routes.url_helpers
    include Capybara::DSL

    def visit_page
      visit pokemons_path
    end

    def click_evolve
      click_button "Evolve"
    end

    def visible?
      has_text?("All Pokemons")
    end

    def successfully_evolved?
      has_text?("Pokemon successfully evolved")
    end

    def successfully_created?
      has_text?("Pokemon successfully created")
    end

    def has_displayed_pokemon?(name:, kind:)
      has_text?("Name: #{name}") &&
        has_text?("Kind: #{kind}")
    end
  end
end
