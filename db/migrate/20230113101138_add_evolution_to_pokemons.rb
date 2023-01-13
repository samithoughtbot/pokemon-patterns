class AddEvolutionToPokemons < ActiveRecord::Migration[7.0]
  def change
    add_column :pokemons, :evolution, :integer, null: false, default: 1
  end
end
