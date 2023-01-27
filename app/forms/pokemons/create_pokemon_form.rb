class Pokemons::CreatePokemonForm
  include ActiveModel::Model

  attr_accessor :name, :kind, :pokemon

  validates :name, :kind, presence: true
  validate :is_original_150?

  def initialize(params={})
    super(params)
    @pokemon = Pokemon.new(name: name, kind: kind)
  end
  
  def save
    return false if invalid?
    
    pokemon.save!
  end

  private 

  def is_original_150?
    unless pokemon.is_original_150?
      errors.add(:name, "must be one of the original 150 pokemon")
    end
  end

end
