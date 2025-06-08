require_relative 'board'
require_relative 'player'

class TicTacToe
  def initialize
    @board = Board.new
    @players = [Player.new("X"), Player.new("O")]
    @current_player = 0
  end

  def play
    loop do
      @board.display
      make_move
      if winner?
        @board.display
        puts "Player #{current_player.marker} wins!"
        break
      elsif draw?
        @board.display
        puts "It's a draw!"
        break
      end
      switch_player
    end
  end

  private

  def current_player
    @players[@current_player]
  end

  def make_move
    loop do
      row, col = current_player.get_move
      
      if @board.valid_position?(row, col)
        @board.place_marker(row, col, current_player.marker)
        break
      else
        puts "Invalid move. Try again."
      end
    end
  end

  def winner?
    @board.winning_combination?(current_player.marker)
  end

  def draw?
    @board.full?
  end

  def switch_player
    @current_player = (@current_player + 1) % 2
  end
end
