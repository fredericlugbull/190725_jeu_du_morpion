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
  end
end



CARSANO:

class Board
  attr_reader :cases, :nb_coups_joues, :aborted
  
  def initialize
    # Ici on initialise un plateau
    # On crée les boardcases
    a1=BoardCase.new(1) 
    a2=BoardCase.new(2)
    a3=BoardCase.new(3) 
    b1=BoardCase.new(4) 
    b2=BoardCase.new(5) 
    b3=BoardCase.new(6) 
    c1=BoardCase.new(7) 
    c2=BoardCase.new(8) 
    c3=BoardCase.new(9)  
    @cases = [a1, a2, a3, b1, b2, b3, c1, c2, c3] # On stocke les boardcases
    @nb_coups_joues = 0
    @aborted = false
  end

  def change_value_case(bcase, value) # On applique le changement à la case
    begin
      @cases[bcase].change_content(value)
      add_coup
    rescue
      ending_play # Si on joue quitter
    end
  end

  def ending_play
    @aborted = true
  end

  def add_coup
    @nb_coups_joues += 1
  end

  def verif_alignement_points # On vérifie si le joueur gagne
    if verif_lines or verif_columns or verif_diagos
      true
    else
      false
    end
  end

  def verif_lines # On vérifie chaque ligne
    # verif lignes
    if @cases[0].content != " " and [@cases[0].content, @cases[1].content, @cases[2].content] == [@cases[0].content, @cases[0].content, @cases[0].content]
      colorize_win(@cases[0], @cases[1], @cases[2]) # Si c'est bon on color en vert les cases
      return true
    elsif @cases[3].content != " " and [@cases[3].content, @cases[4].content, @cases[5].content] == [@cases[3].content, @cases[3].content, @cases[3].content]
      colorize_win(@cases[3], @cases[4], @cases[5])
      return true
    elsif @cases[6].content != " " and [@cases[6].content, @cases[7].content, @cases[8].content] == [@cases[6].content, @cases[6].content, @cases[6].content]
      colorize_win(@cases[6], @cases[7], @cases[8])
      return true
    else
      return false 
    end
  end

  def verif_columns
    if @cases[0].content != " " and [@cases[0].content, @cases[3].content, @cases[6].content] == [@cases[0].content, @cases[0].content, @cases[0].content]
      colorize_win(@cases[0], @cases[3], @cases[6])
      return true
    elsif @cases[1].content != " " and [@cases[1].content, @cases[4].content, @cases[7].content] == [@cases[1].content, @cases[1].content, @cases[1].content]
      colorize_win(@cases[1], @cases[4], @cases[7])
      return true
    elsif @cases[2].content != " " and [@cases[2].content, @cases[5].content, @cases[8].content] == [@cases[2].content, @cases[2].content, @cases[2].content]
      colorize_win(@cases[2], @cases[5], @cases[8])
      return true
    else
      return false 
    end

  end

  def verif_diagos
    if @cases[0].content != " " and [@cases[0].content, @cases[4].content, @cases[8].content] == [@cases[0].content, @cases[0].content, @cases[0].content]
      colorize_win(@cases[0], @cases[4], @cases[8])
      return true
    elsif @cases[2].content != " " and [@cases[2].content, @cases[4].content, @cases[6].content] == [@cases[2].content, @cases[2].content, @cases[2].content]
      colorize_win(@cases[2], @cases[4], @cases[6])
      return true
    else
      return false 
    end
  end

  def colorize_win(cells1, cells2, cells3) # Color les cases en vert
    cells1.change_color
    cells2.change_color
    cells3.change_color
  end
end