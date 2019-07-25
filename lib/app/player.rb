# Player
# Variables d'instance : un joueur a un nom et un symbole ("x" ou "o").
require "pry"

class Player
  #TO DO : la classe a 2 attr_reader, son nom et sa valeur (X ou O).
  attr_reader :player_name, :player_value
  
  def initialize(player_name, player_value)
    #TO DO : doit régler son nom et sa valeur
    @player1 = gets.chomp
    @player2 = gets.chomp
    @player_value = /"x" || "o"/
  end

binding.pry
end
