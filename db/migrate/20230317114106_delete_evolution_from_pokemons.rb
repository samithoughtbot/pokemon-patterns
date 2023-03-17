class DeleteEvolutionFromPokemons < ActiveRecord::Migration[7.0]
  def change
    remove_column :pokemons, :evolution
  end
end
