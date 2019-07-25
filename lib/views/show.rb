class Show

  def initialize(game)
    @game = game
  end

  def show_board(board)
    #TO DO : affiche sur le terminal l'objet de classe Board en entrée. S'active avec un Show.new.show_board(instance_de_Board)
    rows_morp = [
      [@game.board.boardcase_array[0].value, @game.board.boardcase_array[1].value, @game.board.boardcase_array[2].value],
      [@game.board.boardcase_array[3].value, @game.board.boardcase_array[4].value, @game.board.boardcase_array[5].value],
      [@game.board.boardcase_array[6].value, @game.board.boardcase_array[7].value, @game.board.boardcase_array[8].value] 
    ]
    Terminal::Table.new :headings => ['1','2','3'],:rows => rows_morp
  end
end

