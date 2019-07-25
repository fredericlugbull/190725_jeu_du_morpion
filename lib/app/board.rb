# Board : à l'initialisation du plateau, il doit instancier immédiatement 9 BoardCases (une par case). 
# Variables d'instance : le Board doit embarquer les 9 BoardCase du jeu afin de pouvoir les lire et les modifier facilement. 
# Il faut les lui attribuer sous forme d'un array ou d'un hash. Aussi, il est utile de compter le nombre de coup joué pour
#  identifier facilement si on arrive au 9ème coup sans vainqueur. 
# Méthodes : le Board va s'occuper de faire le lien entre les BoardCases et le Game : il change les valeurs des BoardCases 
# (de " " à "x" ou "o") et vérifie en fonction de la combinaison des BoardCases si la partie est finie (= un joueur a gagné ou 
# bien les 9 cases sont remplies sans vainqueur).

class Board < BoardCase
  #TO DO : la classe a 1 attr_accessor : un array/hash qui contient les BoardCases.
  #Optionnellement on peut aussi lui rajouter un autre sous le nom @count_turn pour compter le nombre de coups joué
  attr_accessor :BoardCase_array

  def initialize
    #TO DO :
    #Quand la classe s'initialize, elle doit créer 9 instances BoardCases
    #Ces instances sont rangées dans un array/hash qui est l'attr_accessor de la classe
    @a1 = BoardCase.new("a1" , "  ")
    @a2 = BoardCase.new("a2" , "  ")
    @a3 = BoardCase.new("a3" , "  ")
    @b1 = BoardCase.new("b1" , "  ")
    @b2 = BoardCase.new("b2" , "  ")
    @b3 = BoardCase.new("b3" , "  ")
    @c1 = BoardCase.new("c1" , "  ")
    @c2 = BoardCase.new("c2" , "  ")
    @c3 = BoardCase.new("c3" , "  ")
@array_case= [ @a1 , @a2 , @a3, @b1, @b2, @b3, @c1, @c2, @c3]
  end

  def play_turn
    #TO DO : une méthode qui :
    #1) demande au bon joueur ce qu'il souhaite faire
    #2) change la BoardCase jouée en fonction de la valeur du joueur (X ou O)
  end

  def victory?
    #TO DO : une méthode qui vérifie le plateau et indique s'il y a un vainqueur ou match nul
  end
end
