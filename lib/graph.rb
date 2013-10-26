class Graph
  
  attr_accessor :vertex, :nodes
  
  def initialize(vertex_to_initialize = [])
    @nodes = []
    @vertex = []
    create_vertex(vertex_to_initialize)
    create_nodes
  end

  def add_vertex(nodes = [], distance)
    @vertex << Vertex.new(nodes, distance)
  end
  
  # private
  
  def create_nodes
    node_name_from_vertex.each do |node_name|
      @nodes << Node.new(node_name, vertex.map(&:nodes))
    end
  end

  def node_name_from_vertex
    vertex.map(&:nodes).flatten.uniq
  end

  def create_vertex(vertex_to_create)
    vertex_to_create.each do |single_vertex|
      add_vertex([single_vertex[0], single_vertex[1]], single_vertex[2])
    end
  end
end