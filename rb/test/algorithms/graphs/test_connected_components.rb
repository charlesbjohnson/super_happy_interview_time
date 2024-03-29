# frozen_string_literal: true

require("config")

require("algorithms/graphs/connected_components")
require("data_structures/undirected_graph")

describe(Algorithms::Graphs::ConnectedComponents) {
  subject { Algorithms::Graphs::ConnectedComponents.new(graph) }

  let(:graph) { DataStructures::UndirectedGraph.new }
  let(:edges) {
    [
      [0, 1],
      [0, 2],
      [0, 5],
      [0, 6],
      [3, 4],
      [3, 5],
      [4, 5],
      [4, 6],
      [7, 8],
      [9, 10],
      [9, 11],
      [9, 12]
    ]
  }

  before { edges.each { |from, to| graph.add_edge(from, to) } }

  it { _(subject).must_respond_to(:connected?) }
  it { _(subject).must_respond_to(:count) }
  it { _(subject).must_respond_to(:id) }

  describe("#connected?") {
    describe("when the vertices are connected") {
      it("returns true") {
        _(subject.connected?(3, 6)).must_equal(true)
      }
    }

    describe("when the vertices are not connected") {
      it("returns false") {
        _(subject.connected?(2, 8)).must_equal(false)
      }
    }
  }

  describe("#count") {
    it("returns the number of component groups for the graph") {
      _(subject.count).must_equal(3)
    }
  }

  describe("#id") {
    it("returns the id of the component group for the target vertex") {
      _(subject.id(12)).must_equal(2)
    }
  }
}
