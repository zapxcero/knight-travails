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
    @hash.each do |x, v|
      if v.include? key_2
        @path.append(x)
        return something(x)
      end
    end
  end
end

k = Knight.new([0, 7], [5, 1])
k.generate_vertices
k.something(k.finish)
puts "You made it in #{k.path.length - 1} moves!\nHere's your path: \n#{k.path.reverse}"

arr = [
  %w[W B W B W B W B],
  %w[B W B W B W B W],
  %w[W B W B W B W B],
  %w[B W B W B W B W],
  %w[W B W B W B W B],
  %w[B W B W B W B W],
  %w[W B W B W B W B],
  %w[B W B W B W B W]
]
puts
puts
arr.each_with_index do |r, r_i|
  r.each_with_index do |_c, c_i|
    print "[#{r_i},#{c_i}] "
  end
  puts
end
