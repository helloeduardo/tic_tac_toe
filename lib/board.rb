class Board

  def initialize
    @rows = [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]]
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

  def win?
  end

  def draw?
  end

end
