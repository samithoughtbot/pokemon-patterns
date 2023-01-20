class Pokemons::CreatePokemonForm
  include ActiveModel::Model

  attr_accessor :name, :kind

  validates :name, :kind, presence: true
  validates :name, inclusion: { 
    in: OriginalPokemon::NAMES, 
    message: "must be one of the original 150 pokemon" 
  }

  def save
    return false if invalid?
    
    pokemon = Pokemon.new(name: name, kind: kind)
    pokemon.save!
  end

end
