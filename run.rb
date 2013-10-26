require 'debugger';
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }
graph = Graph.new [[1,6,14],[1,3,9],[1,2,7],[2,3,10],[2,4,16],[3,6,2],[3,3,11],[4,5,6],[5,6,9]]
djikstra = Djikstra.new graph, 1, 5
djikstra.iteration_nodes