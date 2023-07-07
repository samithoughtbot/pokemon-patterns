class PokemonPresenter < SimpleDelegator
  def initialize(pokemon:)
    super(pokemon)
  end

  def uppercase_name
    name.upcase
  end
end
