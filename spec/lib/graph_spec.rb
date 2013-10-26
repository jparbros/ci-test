require File.dirname(__FILE__) + '/../spec_helper'

describe Graph do
  describe "#initialize" do
    describe "only nodes" do
      it "should create vertex without distance" do
        graph = Graph.new [[1,2], [2,4], [1,3],[3,4],[3,2]]
        graph.vertex.each do |vertex|
          vertex.distance.should be_nil
        end
      end
    end

    describe "nodes and distance" do
      it "should create vertex with nodes and distance" do
        graph = Graph.new [[1,2,6], [2,4,7], [1,3,8],[3,4,4],[3,2,5]]
        graph.vertex.each do |vertex|
          vertex.distance.should_not be_nil
        end
      end
    end
  end
end