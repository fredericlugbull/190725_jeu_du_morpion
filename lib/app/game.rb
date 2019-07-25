# Game : cette classe s'occupe de gérer toute la partie. À l'initialisation elle crée 2 instances de Player, et 1 instance de Board.
# Variables d'instance : tu peux lui rattacher les 2 players (sous forme d'un array), le Board, et des informations annexes comme 
# "quel joueur doit jouer ?", "quel est le statut de la partie (en cours ? player1 a gagné ? etc.)", etc.
# Méthodes : Game permet de jouer un tour (demande au joueur ce qu'il veut faire et rempli la case), s'occupe de finir la partie 
# si un joueur a gagné et propose aux joueurs de faire une nouvelle partie ensuite.


class Game
  # #TO DO : la classe a plusieurs attr_accessor: le current_player (égal à un objet Player), le status (en cours, nul ou un objet
  #  Player s'il gagne), le Board et un array contenant les 2 joueurs.
  attr_accessor :current_player, :status
end
  def initialize
    #TO DO : créé 2 joueurs, créé un board, met le status à "on going", défini un current_player
     players_array = [player1 = Player.new('Jo'), player2 = Player.new('Carl')]


  end

  def turn
    #TO DO : méthode faisant appel aux méthodes des autres classes (notamment à l'instance de Board). Elle affiche le plateau, 
    #demande au joueur ce qu'il joue, vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie.
  end

  def new_round
    # TO DO : relance une partie en initialisant un nouveau board mais en gardant les mêmes joueurs.
  end

  def game_end
    # TO DO : permet l'affichage de fin de partie quand un vainqueur est détecté ou si il y a match nul
  end    

end






CARSANO:

class Game
  attr_reader :board, :active_player, :j1, :j2
  def initialize(j1,j2, active_player=j1)
    # initialize une nouvelle partie
    @board = Board.new # On crée un nouveau board
    @cases_availables = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3", "QUITTER LA PARTIE"] # Les cases de choix de jeu
    @prompt = TTY::Prompt.new
    @j1 = j1
    @j2 = j2
    @active_player = active_player
  end
  def verify_endgame
    # On va vérifier si 3 pions sont alignés ou si le jeu est complet, ou si le jeu est quitté en cours
    if @board.verif_alignement_points or @board.nb_coups_joues == 9 or @board.aborted 
      true
    else
      false
    end
  end

  def place_value # On place la value
    choice = @prompt.select("#{@active_player.name} (#{@active_player.symbol}), à vous de jouer : ", @cases_availables, cycle: true) 
    @cases_availables.delete(choice)
    @board.change_value_case(transform_choice(choice), @active_player.symbol)
    change_active_player
    choice = @prompt.select("#{@active_player.name} (#{@active_player.symbol}), à vous de jouer : ", @cases_availables, cycle: true) # On choisit parmi la liste des choix disponibles
    @cases_availables.delete(choice) # On supprime de la liste le choix de l'utilisateur
    @board.change_value_case(transform_choice(choice), @active_player.symbol) # On applique au boardcase correspondant la bonne valeur
    change_active_player # On change de joueur
  end

  def transform_choice(choice)
@@ -43,7 +43,7 @@ def transform_choice(choice)
    end
  end

  def change_active_player
  def change_active_player # Changement de joueur
    if @active_player == @j1
      @active_player = @j2
    else
      @active_player = @j1
    end
  end
end