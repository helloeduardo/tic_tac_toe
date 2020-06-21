class Board
  attr_reader :rows, :available_cells

  def initialize
    @rows = [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]]
    @available_cells = 9
  end

  def display
    @rows.each do |row|
      row.each do |cell|
        print cell + " "
      end
      print "\n"
    end
  end

  def update(cell, token)
    @rows.each do |row|
      if row.include?(cell) && cell != "X" && cell != "O"
        row[row.index(cell)] = token
        @available_cells -= 1
      end
    end

  end

  def valid_cell?(cell)
    valid_cell = false
    @rows.each do |row|
      valid_cell = true if row.include?(cell) && cell != "X" && cell != "O"
    end
    valid_cell
  end

  def win?(token)
    rows_match?(token) || columns_match?(token) || diagonals_match?(token)
  end

  def rows_match?(token)
    rows.any? { |row| row == [token, token, token] }
  end

  def columns_match?(token)
    columns = []
    3.times do |i|
      columns << [rows[0][i], rows[1][i], rows[2][i]]
    end
    columns.any? { |column| column == [token, token, token] }
  end

  def diagonals_match?(token)
    diagonals = [[rows[0][0], rows[1][1], rows[2][2]], [rows[0][2], rows[1][1], rows[2][0]]]
    diagonals.any? { |diagonal| diagonal == [token, token, token] }
  end

  def draw?
    available_cells == 0
  end

end
