# frozen_string_literal: true

require("config")

require("algorithms/graphs/undirected_cycle_detection")
require("data_structures/undirected_graph")

describe(Algorithms::Graphs::UndirectedCycleDetection) {
  subject { Algorithms::Graphs::UndirectedCycleDetection.new(graph) }

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
      it("returns true") {
        _(subject.cycle?).must_equal(true)
      }
    }

    describe("#cycle") {
      it("returns the cycle") {
        _(subject.cycle).must_equal([6, 7, 8, 6])
      }
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
      it("returns false") {
        _(subject.cycle?).must_equal(false)
      }
    }

    describe("#cycle") {
      it("returns nil") {
        _(subject.cycle).must_be_nil
      }
    }
  }
}
