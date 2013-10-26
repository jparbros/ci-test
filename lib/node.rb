Node = Struct.new :name, :neighbors, :visited

class Node
  attr_accessor :name, :neighbors, :visited
  
  def initialize(name, neighbors)
    @name = name
    @neighbors = neighbors
    @visited = false
  end
  
  def visited!
    visited = true
  end
  
  def visited?
    visited
  end
end