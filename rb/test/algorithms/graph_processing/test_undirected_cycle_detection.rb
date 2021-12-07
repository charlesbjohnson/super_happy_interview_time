# frozen_string_literal: true

require("config")

require("algorithms/graph_processing/undirected_cycle_detection")
require("data_structures/undirected_graph")

describe(Algorithms::GraphProcessing::UndirectedCycleDetection) {
  subject { Algorithms::GraphProcessing::UndirectedCycleDetection.new(graph) }

  let(:graph) { DataStructures::UndirectedGraph.new }

  it { _(subject).must_respond_to(:cycle?) }
  it { _(subject).must_respond_to(:cycle) }

  describe("when there is a cycle") {
    let(:edges) {
      [
        [0, 1],
        [0, 2],
        [2, 3],
        [4, 5],
        [5, 6],
        [6, 7],
        [6, 8],
        [6, 9],
        [7, 8]
      ]
    }

    before { edges.each { |from, to| graph.add_edge(from, to) } }

    describe("#cycle?") {
      it("returns true") do
        _(subject.cycle?).must_equal(true)
      end
    }

    describe("#cycle") {
      it("returns the cycle") do
        _(subject.cycle).must_equal([6, 7, 8, 6])
      end
    }
  }

  describe("when there is no cycle") {
    let(:edges) {
      [
        [0, 1],
        [0, 2],
        [1, 3],
        [1, 4],
        [2, 5],
        [2, 6]
      ]
    }

    before { edges.each { |from, to| graph.add_edge(from, to) } }

    describe("#cycle?") {
      it("returns false") do
        _(subject.cycle?).must_equal(false)
      end
    }

    describe("#cycle") {
      it("returns nil") do
        _(subject.cycle).must_be_nil
      end
    }
  }
}
