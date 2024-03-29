class OriginalPokemon < ApplicationRecord
  self.abstract_class = true

  POKEDEX = [
    {1 => "Bulbasaur", 2 => "Ivysaur", 3 => "Venusaur"},
    {1 => "Charmander", 2 => "Charmeleon", 3 => "Charizard"},
    {1 => "Squirtle", 2 => "Wartortle", 3 => "Blastoise"},
    {1 => "Caterpie", 2 => "Metapod", 3 => "Butterfree"},
    {1 => "Weedle", 2 => "Kakuna", 3 => "Beedrill"},
    {1 => "Pidgey", 2 => "Pidgeotto", 3 => "Pidgeot"},
    {1 => "Rattata", 2 => "Raticate"},
    {1 => "Spearow", 2 => "Fearow"},
    {1 => "Ekans", 2 => "Arbok"},
    {1 => "Pikachu", 2 => "Raichu"},
    {1 => "Sandshrew", 2 => "Sandslash"},
    {1 => "Nidoran", 2 => "Nidorina", 3 => "Nidoqueen"},
    {1 => "Nidoran", 2 => "Nidorino", 3 => "Nidoking"},
    {1 => "Clefairy", 2 => "Clefable"},
    {1 => "Vulpix", 2 => "Ninetales"},
    {1 => "Jigglypuff", 2 => "Wigglytuff"},
    {1 => "Zubat", 2 => "Golbat"},
    {1 => "Oddish", 2 => "Gloom", 3 => "Vileplume"},
    {1 => "Paras", 2 => "Parasect"},
    {1 => "Venonat", 2 => "Venomoth"},
    {1 => "Diglett", 2 => "Dugtrio"},
    {1 => "Meowth", 2 => "Persian"},
    {1 => "Psyduck", 2 => "Golduck"},
    {1 => "Mankey", 2 => "Primeape"},
    {1 => "Growlithe", 2 => "Arcanine"},
    {1 => "Poliwag", 2 => "Poliwhirl", 3 => "Poliwrath"},
    {1 => "Abra", 2 => "Kadabra", 3 => "Alakazam"},
    {1 => "Machop", 2 => "Machoke", 3 => "Machamp"},
    {1 => "Bellsprout", 2 => "Weepinbell", 3 => "Victreebel"},
    {1 => "Tentacool", 2 => "Tentacruel"},
    {1 => "Geodude", 2 => "Graveler", 3 => "Golem"},
    {1 => "Ponyta", 2 => "Rapidash"},
    {1 => "Slowpoke", 2 => "Slowbro"},
    {1 => "Magnemite", 2 => "Magneton"},
    {1 => "Farfetch'd", 2 => "Doduo", 3 => "Dodrio"},
    {1 => "Seel", 2 => "Dewgong"},
    {1 => "Grimer", 2 => "Muk"},
    {1 => "Shellder", 2 => "Cloyster"},
    {1 => "Gastly", 2 => "Haunter", 3 => "Gengar"},
    {1 => "Onix"},
    {1 => "Drowzee", 2 => "Hypno"},
    {1 => "Krabby", 2 => "Kingler"},
    {1 => "Voltorb", 2 => "Electrode"},
    {1 => "Exeggcute", 2 => "Exeggutor"},
    {1 => "Cubone", 2 => "Marowak"},
    {1 => "Hitmonlee", 2 => "Hitmonchan"},
    {1 => "Lickitung"},
    {1 => "Koffing", 2 => "Weezing"},
    {1 => "Rhyhorn", 2 => "Rhydon"},
    {1 => "Chansey"},
    {1 => "Tangela"},
    {1 => "Kangaskhan"},
    {1 => "Horsea", 2 => "Seadra"},
    {1 => "Goldeen", 2 => "Seaking"},
    {1 => "Staryu", 2 => "Starmie"},
    {1 => "Mr. Mime"},
    {1 => "Scyther"},
    {1 => "Jynx"},
    {1 => "Electabuzz"},
    {1 => "Magmar"},
    {1 => "Pinsir"},
    {1 => "Tauros"},
    {1 => "Magikarp", 2 => "Gyarados"},
    {1 => "Lapras"},
    {1 => "Ditto"},
    {1 => "Eevee", 2 => "Vaporeon", 3 => "Jolteon", 4 => "Flareon"},
    {1 => "Porygon"},
    {1 => "Omanyte", 2 => "Omastar"},
    {1 => "Kabuto", 2 => "Kabutops"},
    {1 => "Aerodactyl"},
    {1 => "Snorlax"},
    {1 => "Articuno"},
    {1 => "Zapdos"},
    {1 => "Moltres"},
    {1 => "Dratini", 2 => "Dragonair", 3 => "Dragonite"},
    {1 => "Mewtwo"},
    {1 => "Mew"}
  ].freeze

  def is_original_150?
    POKEDEX.map(&:values).flatten.include?(name)
  end

  def evolution_stage
    POKEDEX.map { |h| h.key(name) }.compact.first
  end

  def evolves_into
    POKEDEX.find { |h| h[evolution_stage] == name }[evolution_stage + 1]
  end

  def reached_final_stage?
    !evolves_into
  end
end
