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

class Knight
  attr_accessor :moves

  def initialize(start_loc, end_loc)
    @moves = valid_moves(start_loc[0], start_loc[1])

    knight_moves(@moves, end_loc)
  end

  def valid_moves(r, c)
    valid_m = []
    test = [
      [-2, 1],
      [-2, -1],
      [2, -1],
      [2, 1],
      [-1, -2],
      [1, -2],
      [-1, 2],
      [1, 2]
    ]
    test.each do |el|
      row = el[0] + r
      col = el[1] + c
      valid_m.append([row, col]) if row > 0 && row <= 7 && col > 0 && col <= 7
    end
    valid_m
  end

  def knight_moves(moves, end_loc, queue = [moves.shift])
    return if queue.empty?

    if moves.include?(end_loc)
      p moves
      puts 'Pog'
      return
    end

    m = queue.shift
    queue.append(moves.shift)
    knight_moves(valid_moves(m[0], m[1]), end_loc, queue)
  end
end

GameBoard.new.print_board

Knight.new([3, 3], [0, 0])
