class Pokemons::CreatePokemonForm
  include ActiveModel::Model

  attr_accessor :name, :kind

  validates :name, :kind, presence: true

  def save
    return false if invalid?
    
    pokemon = Pokemon.new(name: name, kind: kind)
    pokemon.save!
  end
end
