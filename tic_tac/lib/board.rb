class Board
    def initialize
      @grid = Array.new(3) { Array.new(3, " ") }
    end
  
    def display
      puts "\n"
      @grid.each_with_index do |row, i|
        puts " #{row[0]} | #{row[1]} | #{row[2]} "
        puts "-----------" unless i == 2
      end
      puts "\n"
    end
  
    def place_marker(row, col, marker)
      @grid[row][col] = marker if valid_position?(row, col)
    end
  
    def valid_position?(row, col)
      row.between?(0, 2) && col.between?(0, 2) && @grid[row][col] == " "
    end
  
    def full?
      @grid.flatten.none? { |cell| cell == " " }
    end
  
    def winning_combination?(marker)
      # Check rows
      @grid.each do |row|
        return true if row.all? { |cell| cell == marker }
      end
  
      # Check columns
      3.times do |col|
        return true if (0..2).all? { |row| @grid[row][col] == marker }
      end
  
      # Check diagonals
      return true if (0..2).all? { |i| @grid[i][i] == marker }
      return true if (0..2).all? { |i| @grid[i][2-i] == marker }
  
      false
    end
  end