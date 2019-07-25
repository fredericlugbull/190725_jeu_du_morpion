# Player
# Variables d'instance : un joueur a un nom et un symbole ("x" ou "o").

class Player
  #TO DO : la classe a 2 attr_reader, son nom et sa valeur (X ou O).
  attr_reader :player_name, :player_symbol
  
  def initialize(player_name, player_symbol)
    #TO DO : doit régler son nom et sa valeur
    @player_name = player_name
    @player_symbol = player_symbol
  end

end

