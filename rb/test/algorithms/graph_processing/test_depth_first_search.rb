# frozen_string_literal: true

require("config")

require("algorithms/graph_processing/depth_first_search")
require("data_structures/undirected_graph")

describe(Algorithms::GraphProcessing::DepthFirstSearch) {
  subject { Algorithms::GraphProcessing::DepthFirstSearch.new(graph, 0) }

  let(:graph) { DataStructures::UndirectedGraph.new }

  it { _(subject).must_respond_to(:marked?) }
  it { _(subject).must_respond_to(:count) }

  describe("with an undirected graph") {
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

    describe("#marked?") {
      it("returns true if the source is connected to the target") {
        _(subject.marked?(3)).must_equal(true)
      }

      it("returns false if the source is not connected to the target") {
        _(subject.marked?(9)).must_equal(false)
      }
    }

    describe("#count") {
      it("returns the number of vertices connected to the source") {
        _(subject.count).must_equal(6)
      }
    }
  }

  describe("with a directed graph") {
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
        [6, 9],
        [7, 6],
        [7, 8],
        [8, 7],
        [8, 9],
        [9, 10],
        [9, 11],
        [10, 12],
        [11, 12],
        [12, 9]
      ]
    }

    before { edges.each { |from, to| graph.add_edge(from, to) } }

    describe("#marked?") {
      it("returns true if the source is connected to the target") {
        _(subject.marked?(3)).must_equal(true)
      }

      it("returns false if the source is not connected to the target") {
        _(subject.marked?(9)).must_equal(false)
      }
    }

    describe("#count") {
      it("returns the number of vertices connected to the source") {
        _(subject.count).must_equal(5)
      }
    }
  }
}
