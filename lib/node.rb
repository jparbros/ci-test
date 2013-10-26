class Node
  attr_accessor :name, :neighbors, :visited, :predecessor, :accumulated, :iteration_number
  
  def initialize(name, vertex = [], parent = nil)
    @name = name
    @neighbors = get_neighbors_from_vertex(vertex)
    @parent = parent
    @visited = false
    @labels = []
  end

  def visited!
    @visited = true
  end

  def visited?
    visited
  end

  def get_neighbors_from_vertex vertex
    (vertex.select {|single_vertex| single_vertex.include? self.name}.flatten.uniq - [name])
  end

  def is_neighbors? node_name
    neighbors.map(&:name).include? node_name
  end

  def have_neighbors_without_visit?
     neighbors.select {|neighbor| !neighbor.visited?}.length > 0
  end

  def is_child_of_node? node_name
    parent == node_name
  end
  
  def label=(label_values = [])
    if @accumulated.nil? || @accumulated >= label_values[0]
      @accumulated = label_values[0]
      @predecessor = label_values[1]
      @iteration_number = label_values[2]
    end
  end
end