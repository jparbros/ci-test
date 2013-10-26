class Path
  attr_accessor :distance, :current_path
  
  def initialize(first_node)
    @distance = 0
    @current_path = []
    @current_path << first_node
  end
  
  def add_node(node_name, distance)
    @current_path << node_name
    @distance += distance
  end
end