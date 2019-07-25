
# BoardCase : chacune des 9 instances de BoardCase correspond à l'état d'une case du plateau. 
# Variables d'instance : une Boardcase est définie par sa position (A1, B2, B3, etc.) et son contenu (Soit elle est vide, 
# soit elle a comme valeur le string "x", soit elle a comme valeur le string "o").

class BoardCase
  #TO DO : la classe a 2 attr_accessor, sa valeur en string (X, O, ou vide), ainsi que son identifiant de case
  attr_accessor :string_value, :case_id
  
  def initialize(case_id, string_value)
    #TO DO : doit régler sa valeur, ainsi que son numéro de case
    @case_id =  case_id
    @string_value = string_value
  
  end

end



CARSANO:

class BoardCase
 attr_reader :content     #REMARQUE DE MOI FRED, JE PENSE QUIL A OUBLIé POSITION ICI.
 def initialize(position)
   # Ici on initialise une case du plateau
   @position = position
   @content = " "
 end

 def change_content(value)
   @content = value
 end

 def change_color
   @content = @content.colorize(:green)
 end
 end
