# frozen_string_literal: true

require("config")

require("algorithms/graph_processing/strongly_connected_components")
require("data_structures/directed_graph")

describe(Algorithms::GraphProcessing::StronglyConnectedComponents) {
  subject { Algorithms::GraphProcessing::StronglyConnectedComponents.new(graph) }

  let(:graph) { DataStructures::DirectedGraph.new }
  let(:edges) {
    [
      [0, 1],
      [0, 5],
      [2, 0],
      [2, 3],
      [3, 2],
      [3, 5],
      [4, 2],
      [4, 3],
      [5, 4],
      [6, 0],
      [6, 4],
      [6, 8],
      [6, 9],
      [7, 6],
      [7, 9],
      [8, 6],
      [9, 10],
      [9, 11],
      [10, 12],
      [11, 4],
      [11, 12],
      [12, 9]
    ]
  }

  before { edges.each { |from, to| graph.add_edge(from, to) } }

  it { _(subject).must_respond_to(:connected?) }
  it { _(subject).must_respond_to(:count) }
  it { _(subject).must_respond_to(:id) }

  describe("#connected?") {
    describe("when the vertices are connected") {
      it("returns true") do
        _(subject.connected?(0, 4)).must_equal(true)
      end
    }

    describe("when the vertices are not connected") {
      it("returns false") do
        _(subject.connected?(3, 6)).must_equal(false)
      end
    }
  }

  describe("#count") {
    it("returns the number of component groups for the graph") do
      _(subject.count).must_equal(5)
    end
  }

  describe("#id") {
    it("returns the id of the component group for the target vertex") do
      _(subject.id(7)).must_equal(4)
    end
  }
}
