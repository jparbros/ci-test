class Graph
  attr_accessor :vertex
  
  def initialize(nodes = [])
    @vertex = []
    @letters = (‘A’..’ZZ’).to_a
    @nodes = nodes
    create_vertex if @nodes.length > 0
  end
]
  def add_vertex(name, nodes = [])
    @vertex << Vertex.new name: name, node_x: nodes[0], node_y: nodes[1], distance: nodes[2]
  end
  
  private
  
  def create_vertex
    @nodes.each_with_index do |node, index|
      add_vertex(@letters[index], node)
    end
  end
end