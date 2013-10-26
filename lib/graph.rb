class Graph
  
  attr_accessor :vertex, :nodes
  
  def initialize(vertex_to_initialize = [])
    @nodes = []
    @vertex = []
    create_vertex(vertex_to_initialize)
    create_nodes
  end

  def get_vertex_from_node node_source, node_destination
    @vertex.select {|vertex| vertex.nodes.include?(node_source) && vertex.nodes.include?(node_destination)}.first
  end
  
  def get_node_from_name(node_name)
    @nodes.select {|node| node.name == node_name}.first
  end

  def get_permanet_node
    @nodes.select{|node| !node.visited? and !node.accumulated.nil? }.sort {|node_a, node_b| node_a.accumulated <=> node_b.accumulated}.first
  end
  
  private
  
  def add_vertex(nodes = [], distance)
    @vertex << Vertex.new(nodes, distance)
  end
  
  def create_nodes
    node_name_from_vertex.each do |node_name|
      @nodes << Node.new(node_name.to_i, vertex.map(&:nodes))
    end
    set_neighbors_nodes
  end
  
  def set_neighbors_nodes
    @nodes.each do |node|
      node.neighbors = @nodes.select {|current_node| node.neighbors.include? current_node.name}
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