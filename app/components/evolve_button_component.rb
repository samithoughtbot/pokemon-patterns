class EvolveButtonComponent < ViewComponent::Base
  def initialize(pokemon:)
    @pokemon = pokemon
  end

  def render?
    !pokemon.reached_final_stage?
  end

  private

  attr_reader :pokemon
end
