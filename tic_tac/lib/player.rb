class Player
    attr_reader :marker
  
    def initialize(marker)
      @marker = marker
    end
  
    def get_move
      puts "Player #{marker}, enter row (0-2) and column (0-2) separated by space:"
      gets.chomp.split.map(&:to_i)
    end
  end