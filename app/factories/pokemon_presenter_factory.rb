class PokemonPresenterFactory
  def self.build(active_record_collection)
    active_record_collection.map do |active_record_object|
      PokemonPresenter.new(pokemon: active_record_object)
    end
  end
end