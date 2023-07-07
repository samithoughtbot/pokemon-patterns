require "rails_helper"

RSpec.describe EvolveButtonComponent, type: :component do
  context "when the pokemon has not reached its final evolution stage" do
    it "renders the evolve button" do
      pokemon = double
      allow(pokemon).to receive(:reached_final_stage?).and_return(false)

      render_inline(EvolveButtonComponent.new(pokemon: pokemon))

      expect(page).to have_button "Evolve"
    end
  end

  context "when the pokemon has reached its final evolution stage" do
    it "does not render the evolve button" do
      pokemon = double
      allow(pokemon).to receive(:reached_final_stage?).and_return(true)

      render_inline(EvolveButtonComponent.new(pokemon: pokemon))

      expect(page).to_not have_button "Evolve"
    end
  end
end
