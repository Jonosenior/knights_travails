require_relative 'knight'
require_relative 'vertex'
require_relative 'board'
require_relative 'announcer'
require_relative 'knight_wayfinder'

def start
  @board = Board.new
  @board.populate
  @board.visualise
  @announcer = Announcer.new
  @announcer.introduce
  start_position = @announcer.elicit_square
  target_position = @announcer.elicit_square
  @knight_wayfinder = KnightWayfinder.new(@board, start_position)
  #puts "#{@knight_wayfinder.list_possible_moves(start_position)}"
  #start_vertex = Vertex.new(start_position)
  # @knight_wayfinder.add_neighbouring_squares_to_visit(start_vertex)
  # puts "#{@knight_wayfinder.to_visit.each {|a| a.location}}"

  #puts @knight_wayfinder.list_possible_moves([3,2])

  target = @knight_wayfinder.find_target_square(target_position)
  puts target.location
  @path = @knight_wayfinder.shortest_path(target)
  display_path




end


def display_path
  puts "So you start at #{@path[0]}, like so:"
  @board.move_knight(@path[0])
  @board.visualise
  @path.each_with_index do |move, index|
    unless index < 1
      puts "\n\nThen you move to #{move}"
      @board.move_knight(@path[index-1], move)
      @board.visualise
    end
  end
  puts "\n\nAnd there you go!"
end







start
#board.display_board
#knight = board.knight
#print knight.list_possible_moves([4,2])
#board.move_knight([4,3],[0,0])
#board.display_board
#random = rand(0..7)
#puts knight.wayfinder([rand(0..7), rand(0..7)],[rand(0..7), rand(0..7)])
#puts knight.wayfinder([7,0],[1,5])

#puts board.board[4][3]
#knight_location = board.locate_knight
#puts knight_location
#print board.list_possible_moves([6,3])
#board.knight_location
