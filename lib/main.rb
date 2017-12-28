require_relative 'vertex'
require_relative 'board'
require_relative 'announcer'
require_relative 'wayfinder'

def start
  @board = Board.new
  @board.populate
  @announcer = Announcer.new
  @announcer.introduce
  @board.visualise
  start_position = @announcer.elicit_square
  target_position = @announcer.elicit_square(2)
  @wayfinder = Wayfinder.new(start_position)
  @announcer.wayfinder_introduction(start_position, target_position)
  path = @wayfinder.shortest_path(target_position)
  show_steps(path)
end


def show_steps(path)
  puts "So you start at #{path[0]}, like so:"
  @board.move_knight(path[0])
  @board.visualise
  path.each_with_index do |step, index|
    unless index < 1
      puts "\n\nThen you move to #{step}"
      @board.move_knight(path[index-1], step)
      @board.visualise
    end
  end
  puts "\n\nAnd there you go!"
end

start
