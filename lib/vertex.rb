class Vertex
  attr_accessor :nodes, :distances
  def initialize(nodes = [], distance)
    @nodes = nodes
    @distances = distance
  end
end