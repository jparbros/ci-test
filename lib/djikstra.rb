class Djikstra
  
  attr_accessor :graph, :path
  
  def initialize(graph, start_node, end_node)
    @graph = graph
    @current_node = @start_node = @graph.get_node_from_name start_node
    @end_node = @graph.get_node_from_name end_node
    @path = [@end_node.name]
    mark_start_node_as_visited
  end
  
  def iteration_nodes
    @current_iteration = 0
    @current_node.label = [0, nil, @current_iteration]
    iteration_node
  end
  
  def iteration_node
    graph.unvisited_neighbors_of_node(@current_node).each do |current_iteration_node|
      @current_iteration += 1
      accumulated = @graph.get_vertex_from_node(@current_node.name, current_iteration_node.name).distance + (@current_node.accumulated || 0)
      current_iteration_node.label = [accumulated, @current_node.name, @current_iteration]
    end
    @current_node = @graph.get_permanet_node
    if @current_node
      @current_node.visited!
      iteration_node
    else
      @current_node = @end_node
      get_shorter_path
    end
  end
      
  def get_shorter_path    
    if @current_node.predecessor
      path << @current_node.predecessor
      @current_node = @graph.get_node_from_name @current_node.predecessor
      get_shorter_path
    else
      puts "SHORTER PATH= #{@path.reverse.to_s}"
    end
  end
  
  def labeling
    
  end
  
  private
  
  def mark_start_node_as_visited
    @graph.nodes.each do |node|
      node.neighbors.each do |neighbor|
        if neighbor == @start_node.name
          @graph.get_node_from_name(neighbor).visited!
        end
      end
    end
  end
end