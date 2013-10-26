class Vertex
  attr_accessor :nodes, :distance
  def initialize(nodes = [], distance)
    @nodes = nodes
    @distance = distance
  end
end