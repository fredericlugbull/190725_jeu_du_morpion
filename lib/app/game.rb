# Game : cette classe s'occupe de gérer toute la partie. À l'initialisation elle crée 2 instances de Player, et 1 instance de Board.
# Variables d'instance : tu peux lui rattacher les 2 players (sous forme d'un array), le Board, et des informations annexes comme 
# "quel joueur doit jouer ?", "quel est le statut de la partie (en cours ? player1 a gagné ? etc.)", etc.
# Méthodes : Game permet de jouer un tour (demande au joueur ce qu'il veut faire et rempli la case), s'occupe de finir la partie 
# si un joueur a gagné et propose aux joueurs de faire une nouvelle partie ensuite.


class Game
  # #TO DO : la classe a plusieurs attr_accessor: le current_player (égal à un objet Player), le status (en cours, nul ou un objet
  #  Player s'il gagne), le Board et un array contenant les 2 joueurs.
  attr_accessor :current_player, :status, :board,    # il manque peut être :players ici...

def initialize(user_input, user_input2) 
  #Reprend les noms de application.rb et cree les players
  @players = [player1 = Player.new("#{user_input}", 'x'), player2 = Player.new("#{user_input2}", 'o')]
  @board = Board.new
  @status = "on going"
  @current_player = @players[0]
  @prompt = TTY::Prompt.new
end

def turn
  puts "C'est au tour de #{@current_player.name}"
  @board.play_turn(@current_player)
  show = Show.new(self)
  puts show.show_board
  if @board.victory?(@current_player) == false
    @current_player = (@players.reverse!)[0]
    turn
  end
end

end

