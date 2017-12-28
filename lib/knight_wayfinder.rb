class KnightWayfinder

  attr_reader :location, :path, :to_visit

  def initialize(location)
    @location = location
  end

  def possible_rows(location)
    [location[0]+2,location[0]+1,location[0]-1,location[0]-2].delete_if {|a| a > 7 || a < 0}
  end

  def possible_columns(location)
     [location[1]+2,location[1]+1,location[1]-1,location[1]-2].delete_if {|a| a > 7 || a < 0}
  end


  def list_possible_moves(location)
    legal_moves = []
    possible_rows(location).each do |row|
      possible_columns(location).each do |col|
        legal_moves << [row,col] if legal_knight_move?(location, [row,col])
      end
    end
    legal_moves
  end

  def legal_knight_move?(start_position,finish_position)
    (start_position[0] - finish_position[0]).abs + (start_position[1] - finish_position[1]).abs == 3
  end

  def find_target_square(target)
    visited = []
    to_visit = [Vertex.new(location)]
    until to_visit.empty?
      square = to_visit.shift
      return square if square.location == target
      add_neighbouring_squares_to_visit(square, to_visit, visited)
      visited << square.location
    end
  end

  def add_neighbouring_squares_to_visit(square, to_visit, visited)
    list_possible_moves(square.location).each do |neighbour|
      to_visit << Vertex.new(neighbour, square, square.distance_from_origin+1) unless visited.include?(neighbour) #|| @to_visit.each {|a| a.location == neighbour}
    end
  end

  def shortest_path(target)
    pointer = target
    path = [pointer.location]
    while pointer.parent
      path.unshift(pointer.parent.location)
      pointer = pointer.parent
    end
    path
  end


end
