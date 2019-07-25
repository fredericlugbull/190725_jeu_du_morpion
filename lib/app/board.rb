# Board : à l'initialisation du plateau, il doit instancier immédiatement 9 BoardCases (une par case). 
# Variables d'instance : le Board doit embarquer les 9 BoardCase du jeu afin de pouvoir les lire et les modifier facilement. 
# Il faut les lui attribuer sous forme d'un array ou d'un hash. Aussi, il est utile de compter le nombre de coup joué pour
#  identifier facilement si on arrive au 9ème coup sans vainqueur. 
# Méthodes : le Board va s'occuper de faire le lien entre les BoardCases et le Game : il change les valeurs des BoardCases 
# (de " " à "x" ou "o") et vérifie en fonction de la combinaison des BoardCases si la partie est finie (= un joueur a gagné ou 
# bien les 9 cases sont remplies sans vainqueur).

class Board 
  #TO DO : la classe a 1 attr_accessor : un array/hash qui contient les BoardCases.
  #Optionnellement on peut aussi lui rajouter un autre sous le nom @count_turn pour compter le nombre de coups joué
  attr_accessor :boardcases_array, :count_turn

  def initialize
    #TO DO :
    #Quand la classe s'initialize, elle doit créer 9 instances BoardCases
    #Ces instances sont rangées dans un array/hash qui est l'attr_accessor de la classe
    @boardcase_array = []
    i = 0
    9.times do
      @boardcase_array << BoardCase.new(i)
      i += 1
    end
  end

  def play_turn
    #TO DO : une méthode qui :
    #1) demande au bon joueur ce qu'il souhaite faire
    #2) change la BoardCase jouée en fonction de la valeur du joueur (X ou O)
    case_choice = []
    boardcase_array.each do |c|
      if c.value == " "
      case_choice << c.content
      end
    end
    user_choice = prompt.select("Que voulez-vous faire #{player.name}?", case_choice)   #Créée un user_choice qui va ensuite servir à écraser la valeur existante
    boardcase_array[user_choice].value = player.player_symbol
    puts player_symbol
  end 
   
    

  def victory?
    #TO DO : une méthode qui vérifie le plateau et indique s'il y a un vainqueur ou match nul
    if boardcase_array[0].value == player.player_symbol && boardcase_array[1].value == player.player_symbol && boardcase_array[2].value == player.player_symbol 
      puts "#{player.name} a gagné"
    elsif boardcase_array[3].value == player.player_symbol && boardcase_array[4].value == player.player_symbol && boardcase_array[5].value == player.player_symbol 
      puts "#{player.name} a gagné"
    elsif boardcase_array[6].value == player.player_symbol && boardcase_array[7].value == player.player_symbol && boardcase_array[8].value == player.player_symbol 
      puts "#{player.name} a gagné"
    elsif boardcase_array[0].value == player.player_symbol && boardcase_array[3].value == player.player_symbol && boardcase_array[6].value == player.player_symbol 
      puts "#{player.name} a gagné"
    elsif boardcase_array[1].value == player.player_symbol && boardcase_array[4].value == player.player_symbol && boardcase_array[7].value == player.player_symbol 
      puts "#{player.name} a gagné"
    elsif boardcase_array[2].value == player.player_symbol && boardcase_array[5].value == player.player_symbol && boardcase_array[8].value == player.player_symbol 
      puts "#{player.name} a gagné"
    elsif boardcase_array[0].value == player.player_symbol && boardcase_array[4].value == player.player_symbol && boardcase_array[8].value == player.player_symbol 
      puts "#{player.name} a gagné"
    elsif boardcase_array[2].value == player.player_symbol && boardcase_array[4].value == player.player_symbol && boardcase_array[6].value == player.player_symbol 
      puts "#{player.name} a gagné"
    elsif boardcase_array[0].value != ' ' && boardcase_array[1].value != ' ' && boardcase_array[2].value != ' '  && boardcase_array[3].value != ' '  && boardcase_array[4].value != ' '  && boardcase_array[5].value != ' '  && boardcase_array[6].value != ' '  && boardcase_array[7].value != ' ' && boardcase_array[8].value != ' ' 
      puts "Match nul!"
    else 
      return false    # Le jeu doit continuer, pas de victoire pour l'instant et jeu pas terminé.
    end
end

def count_turn
  count_turn += 1
end