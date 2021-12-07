# frozen_string_literal: true

require("config")

require("algorithms/graph_processing/directed_cycle_detection")
require("data_structures/directed_graph")

describe(Algorithms::GraphProcessing::DirectedCycleDetection) {
  subject { Algorithms::GraphProcessing::DirectedCycleDetection.new(graph) }

  let(:graph) { DataStructures::DirectedGraph.new }

  it { _(subject).must_respond_to(:cycle?) }
  it { _(subject).must_respond_to(:cycle) }

  describe("when there is a cycle") {
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
        [7, 8],
        [8, 7],
        [8, 9],
        [9, 10],
        [9, 11],
        [10, 12],
        [11, 4],
        [11, 12],
        [12, 9]
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
        _(subject.cycle).must_equal([0, 5, 4, 2, 0])
      end
    }
  }

  describe("when there is no cycle") {
    let(:edges) {
      [
        [0, 1],
        [0, 5],
        [2, 3],
        [3, 1],
        [4, 2],
        [4, 3],
        [5, 4],
        [6, 0],
        [6, 4],
        [6, 9],
        [8, 7],
        [8, 9],
        [9, 10],
        [9, 11],
        [10, 12],
        [11, 12]
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
