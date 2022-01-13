# frozen_string_literal: true

require("config")

require("algorithms/graphs/depth_first_paths")
require("data_structures/undirected_graph")

describe(Algorithms::Graphs::DepthFirstPaths) {
  subject { Algorithms::Graphs::DepthFirstPaths.new(graph, 0) }

  let(:graph) { DataStructures::UndirectedGraph.new }

  it { _(subject).must_respond_to(:path_to?) }
  it { _(subject).must_respond_to(:path_to) }

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

    describe("#path_to?") {
      it("returns true if there is a path to the target from the source") {
        _(subject.path_to?(3)).must_equal(true)
      }

      it("returns false if there is no path to the target from the source") {
        _(subject.path_to?(9)).must_equal(false)
      }
    }

    describe("#path_to") {
      it("returns a path to the target when there is one") {
        _([[0, 5, 3], [0, 6, 4, 3]].any?(subject.path_to(3))).must_equal(true)
      }

      it("returns nil when there is no path to the target") {
        _(subject.path_to(9)).must_be_nil
      }
    }
  }

  describe("with an directed graph") {
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

    describe("#path_to?") {
      it("returns true if there is a path to the target from the source") {
        _(subject.path_to?(3)).must_equal(true)
      }

      it("returns false if there is no path to the target from the source") {
        _(subject.path_to?(9)).must_equal(false)
      }
    }

    describe("#path_to") {
      it("returns a path to the target when there is one") {
        _([[0, 5, 4, 3], [0, 5, 4, 2, 3]].any?(subject.path_to(3))).must_equal(true)
      }

      it("returns an empty array when there is no path to the target") {
        _(subject.path_to(9)).must_be_nil
      }
    }
  }
}
