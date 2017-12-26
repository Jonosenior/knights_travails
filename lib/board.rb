class Board
  attr_accessor :contents, :knight, :knight_piece

  def initialize
    @contents = Array.new(8) { Array.new(8)}
    @knight_piece = " ♘ "
    #@knight = Knight.new(@contents, self)
  end

  def populate
    (0...8).each do |row|
      (0...8).each do |cell|
        @contents[row][cell] = "#{row},#{cell}"
      end
    end
    #@contents[4][3] = @knight_piece
    @contents
  end

  def visualise
    (0...8).each do |row|
      puts "\n\n#{@contents[row]}\n" if row == 0
      puts "\n#{@contents[row]}\n" if (1..7).include?(row)
      puts "\n#{@contents[row]}\n\n\n" if row > 7
    end
  end

  def move_knight(current_location, target_location)
    @contents[target_location[0]][target_location[1]] = @knight_piece
    @contents[current_location[0]][current_location[1]] = "#{current_location[0]},#{current_location[1]}"
  end

end
