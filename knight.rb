class GameBoard
  attr_accessor :board

  def initialize
    @board = [
      %w[W B W B W B W B],
      %w[B W B W B W B W],
      %w[W B W B W B W B],
      %w[B W B W B W B W],
      %w[W B W B W B W B],
      %w[B W B W B W B W],
      %w[W B W B W B W B],
      %w[B W B W B W B W]
    ]
  end

  def print_board
    board.each_with_index do |row, row_i|
      row.each_with_index do |_col, col_i|
        print "[#{row_i},#{col_i}]" + ' '
      end
      puts
    end
  end
end
GameBoard.new.print_board

def valid_moves(start)
  r = start[0]
  c = start[1]
  valid_m = []
  first_moves = [
    [-2, 1],
    [-2, -1],
    [2, -1],
    [2, 1],
    [-1, -2],
    [1, -2],
    [-1, 2],
    [1, 2]
  ]
  first_moves.each do |el|
    row = el[0] + r
    col = el[1] + c
    valid_m.append([row, col]) if row.positive? && row <= 7 && col.positive? && col <= 7
  end
  valid_m
end

def knight_moves(start, last)
  moves = valid_moves(start)
  return true if moves.include? last

  queue = moves
  until queue.empty?
    m = queue.shift
    moves = valid_moves(m)
    return true if moves.include? last
  end
end

p knight_moves([0, 0], [6, 1])
