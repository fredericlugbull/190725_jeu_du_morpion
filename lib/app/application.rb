
class Application
  attr_reader :my_game

  def initialize
    puts "Quel est votre nom #Player 1?"
    @user_input = gets.chomp
    puts "Quel est votre nom #Player 2?"
    @user_input2 = gets.chomp
    @prompt = TTY::Prompt.new
    @user_replay = true
  end

  def restart 
    if @prompt.select('Voulez-vous jouer une autre partie?', %w(Oui Non))  == "Oui"
      @user_replay = true
    else
      @user_replay = false
    end
  end

  def start 
    while @user_replay == true 
      my_game = Game.new(@user_input, @user_input2)
      my_game.turn
      restart
    end
    puts "Ok, à bientôt!"
  end

  def perform 
    start
  end

end
