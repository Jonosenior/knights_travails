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
