class Vertex
  attr_reader :location, :parent
  
  def initialize(location, parent=nil)
    @location = location
    @parent = parent
  end

end
