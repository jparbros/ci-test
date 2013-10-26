class Node
  attr_accessor :name, :neighbors, :visited
  
  def initialize(name, vertex = [])
    @name = name
    @neighbors = get_neighbors_from_vertex(vertex)
    @visited = false
  end
  
  def visited!
    @visited = true
  end
  
  def visited?
    visited
  end
  
  def get_neighbors_from_vertex(vertex)
    (vertex.select {|single_vertex| single_vertex.include? name}.flatten.uniq - [name]).map do |node|
      Node.new node
    end
  end
  
  def method_name
    
  end
  
end