class GameBoard
  attr_accessor :board, :knight, :knight_piece

  def initialize
    @board = Array.new(8) { Array.new(8)}
    @knight_piece = " ♘ "
    populate_new_board
    @knight = Knight.new(@board, self)
  end

  def populate_new_board
    (0...8).each do |row|
      (0...8).each do |cell|
        @board[row][cell] = "#{row},#{cell}"
      end
    end
    @board[4][3] = @knight_piece
    @board
  end

  def display_board
    (0...8).each do |row|
      puts "\n\n#{@board[row]}\n" if row == 0
      puts "\n#{@board[row]}\n" if (1..7).include?(row)
      puts "\n#{@board[row]}\n\n\n" if row > 7
    end
  end

  def move_knight(current_location, target_location)
    @board[target_location[0]][target_location[1]] = @knight_piece
    @board[current_location[0]][current_location[1]] = "#{current_location[0]},#{current_location[1]}"
  end

end

class Knight

  attr_reader :location

  def initialize(board, gameboard)
    @gameboard = gameboard
    @board = board
    @location = locate_knight
  end

  def locate_knight
    @board.each_with_index do |row, row_i|
      @board.each_with_index do |col, col_i|
        return [row_i,col_i] if @board[row_i][col_i] == @gameboard.knight_piece
      end
    end
  end

  def list_possible_moves(location)
    legal_moves = []
    possible_rows = [location[0]+2,location[0]+1,location[0]-1,location[0]-2].delete_if {|a| a > 7 || a < 0}
    possible_columns = [location[1]+2,location[1]+1,location[1]-1,location[1]-2].delete_if {|a| a > 7 || a < 0}
    possible_rows.each do |row|
      possible_columns.each do |col|
        legal_moves << [row,col] if legal_knight_move?(location, [row,col])
      end
    end
    legal_moves
  end

  def legal_knight_move?(start_position,finish_position)
    (start_position[0] - finish_position[0]).abs + (start_position[1] - finish_position[1]).abs == 3
  end

  def wayfinder(location, target)
    @location = location
    wayfinder_introduction(location, target)
    visited = []
    to_visit = [Vertex.new(location)]

    until to_visit.empty?
      pointer = to_visit.shift
      return shortest_path(pointer) if pointer.location == target
      list_possible_moves(pointer.location).each do |neighbour|
        to_visit << Vertex.new(neighbour, pointer, pointer.distance_from_origin+1) unless visited.include?(neighbour)
      end
      visited << pointer.location
    end

  end

  def shortest_path(target)
    pointer = target
    @path = [pointer.location]
    while pointer.parent
      @path.unshift(pointer.parent.location)
      pointer = pointer.parent
    end
    puts "You get there in #{@path.length-1} moves."
    puts "Your journey looks like this: #{@path}"
    display_path
  end

  def wayfinder_introduction(location, target)
    puts "\n\nSo... you want to go from #{location} to #{target}, eh?"
    puts "Let's take a look..."
  end

  def display_path
    puts "So you start at #{@path[0]}, like so:"
    @gameboard.move_knight(locate_knight,@path[0])
    @gameboard.display_board
    @path.each_with_index do |move, index|
      unless index < 1
        puts "\n\nThen you move to #{move}"
        @gameboard.move_knight(@path[index-1], move)
        @gameboard.display_board
      end
    end
    puts "\n\nAnd there you go!"
  end


end


class Vertex
  attr_reader :location, :parent, :distance_from_origin #:relatives,

  def initialize(location, parent=nil, distance_from_origin=0)
    @location = location
    #@knight = knight
    #@positions_of_relatives = @knight.list_possible_moves(location)
    #@relatives = []
    @parent = parent
    @distance_from_origin = distance_from_origin
  end

end


board = GameBoard.new
board.populate_new_board
#board.display_board
knight = board.knight
#print knight.list_possible_moves([4,2])
#board.move_knight([4,3],[0,0])
#board.display_board
random = rand(0..7)
#puts knight.wayfinder([rand(0..7), rand(0..7)],[rand(0..7), rand(0..7)])
puts knight.wayfinder([7,0],[1,5])

#puts board.board[4][3]
#knight_location = board.locate_knight
#puts knight_location
#print board.list_possible_moves([6,3])
#board.knight_location
