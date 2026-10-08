class Board
  attr_reader :grid, :columns, :rows

  def initialize
    @rows = 6
    @columns = 7
    @grid = Array.new(@rows) { Array.new(@columns, ' ') }
  end

  def drop_piece (column, piece)
    unless columns.is_a?(Integer) && column.between?(0, @columns - 1)
        raise ArgumentError, "Column must be between 0 and #{@columns - 1}"
    end

    (@rows - 1).downto(0) do |row|
        if @grid[row][column] == ' '
            @grid[row][column] = piece
            return true
        end
    end

    false
  end

  def cell_at(row, column)
    @grid[row][column]
  end

  def full?
    @grid.all? { |row| row.none? { |cell| cell == ' ' } }
  end

  def display
    puts
    @grid.each do |row|
      print "|"
      row.each { |cell| print " #{cell} |" }
      puts
    end
    puts "-----------------------------"
    puts "  0   1   2   3   4   5   6  "
    puts
  end
end
