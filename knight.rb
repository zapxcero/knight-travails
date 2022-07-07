# CREATE BOARD
# CREATE A KNIGHT

# GIVEN A STARTING POSITION, GENERATE ALL POSSIBLE MOVES FOR THE KNIGHT AND STORE IT IN MOVES
# IF FINISH POSITION IS IN MOVES RETURN TRUE
# QUEUE
require 'pp'
class Knight
  attr_reader :hash, :path, :finish

  def initialize(start, finish)
    @vertices = [start]
    @queue = [start]
    @edge = []
    @hash = {}
    @start = start
    @finish = finish
    @path = []
  end

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
      valid_m.append([row, col]) if row >= 0 && row <= 7 && col >= 0 && col <= 7
    end
    valid_m
  end

  def generate_vertices(queue = @queue)
    return if queue.empty? || @vertices.include?(@finish)

    v = queue.shift
    v_moves = valid_moves(v)
    v_moves.each do |m|
      queue.append(m)
      @vertices.append(m)
      @hash[v] = v_moves
    end
    generate_vertices(queue)
  end

  def something(key_2)
    key, _value = @hash.first
    if key_2 == key
      @path.unshift(@finish)
      return nil
    end

    # @path = [key]
    @hash.each do |x, v|
      "#{v}----#{@finish}"
      if v.include? key_2
        @path.append(x)
        return something(x)
      end
    end
  end
end

k = Knight.new([3, 3], [0, 0])
k.generate_vertices
k.something(k.finish)
p k.path.reverse
