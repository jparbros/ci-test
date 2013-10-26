class Graph
  
  attr_accessor :vertex
  
  def initialize(vertex = [])
    @vertex = vertex
    @nodes = []
    if @vertex.length > 0
      create_vertex
      create_nodes
    end
  end

  def add_vertex(name, nodes = [])
    @vertex << Vertex.new(name, nodes[0], nodes[1], nodes[2])
  end
  
  private
  
  def create_nodes
    
  end
  
  def create_node(node_name)
    
  end
  
  def create_vertex
    @nodes.each_with_index do |node, index|
      add_vertex(@letters[index], node)
    end
  end
end