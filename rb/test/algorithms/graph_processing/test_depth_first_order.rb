# frozen_string_literal: true

require("config")

require("algorithms/graph_processing/depth_first_order")
require("data_structures/undirected_graph")

describe(Algorithms::GraphProcessing::DepthFirstOrder) {
  subject { Algorithms::GraphProcessing::DepthFirstOrder.new(graph) }

  let(:graph) { DataStructures::UndirectedGraph.new }

  it { _(subject).must_respond_to(:pre) }
  it { _(subject).must_respond_to(:post) }

  describe("with an undirected graph") {
    let(:edges) {
      [
        [0, 1],
        [0, 2],
        [0, 5],
        [0, 6],
        [1, 4],
        [2, 3],
        [2, 5],
        [3, 4],
        [3, 5],
        [3, 6],
        [4, 6],
        [4, 6]
      ]
    }

    before { edges.each { |from, to| graph.add_edge(from, to) } }

    describe("#pre") {
      it("returns vertices in preorder") do
        _(subject.pre).must_equal([0, 1, 4, 3, 2, 5, 6])
      end
    }

    describe("#post") {
      it("returns vertices in postorder") do
        _(subject.post).must_equal([5, 2, 6, 3, 4, 1, 0])
      end
    }
  }

  describe("with a directed graph") {
    let(:graph) { DataStructures::DirectedGraph.new }
    let(:edges) {
      [
        [0, 1],
        [0, 2],
        [0, 5],
        [1, 4],
        [3, 2],
        [3, 4],
        [3, 5],
        [3, 6],
        [5, 2],
        [6, 0],
        [6, 4]
      ]
    }

    before { edges.each { |from, to| graph.add_edge(from, to) } }

    describe("#pre") {
      it("returns vertices in preorder") do
        _(subject.pre).must_equal([0, 1, 4, 2, 5, 3, 6])
      end
    }

    describe("#post") {
      it("returns vertices in postorder") do
        _(subject.post).must_equal([4, 1, 2, 5, 0, 6, 3])
      end
    }
  }
}
