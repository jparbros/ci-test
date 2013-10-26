class Node
  attr_accessor :name, :neighbors, :visited, :predecessor, :accumulated, :iteration_number
  
  def initialize(name, vertex = [])
    @name = name
    @neighbors = get_neighbors_from_vertex(vertex)
    @visited = false
    @labels = []
  end

  def visited!
    @visited = true
  end

  def visited?
    visited
  end
  
  def unvisited?
    !visited?
  end
  
  def unvisited_neighbors
    @neighbors.select {|neighbor| neighbor.unvisited? }
  end
  
  def label=(label_values = [])
    if @accumulated.nil? || @accumulated >= label_values[0]
      @accumulated = label_values[0]
      @predecessor = label_values[1]
      @iteration_number = label_values[2]
    end
  end
  
  private

  def get_neighbors_from_vertex vertex
    (vertex.select {|single_vertex| single_vertex.include? self.name}.flatten.uniq - [name])
  end
end