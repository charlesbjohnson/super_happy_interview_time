# frozen_string_literal: true

require("config")

require("algorithms/graphs/topological_order")
require("data_structures/directed_graph")

describe(Algorithms::Graphs::TopologicalOrder) {
  subject { Algorithms::Graphs::TopologicalOrder.new(graph) }

  let(:graph) { DataStructures::DirectedGraph.new }

  it { _(subject).must_respond_to(:acyclic?) }
  it { _(subject).must_respond_to(:order) }

  describe("when the graph is acyclic") {
    let(:edges) {
      [
        [0, 1],
        [0, 5],
        [0, 6],
        [2, 0],
        [2, 3],
        [3, 5],
        [5, 4],
        [6, 4],
        [6, 9],
        [7, 6],
        [8, 7],
        [9, 10],
        [9, 11],
        [9, 12],
        [11, 12]
      ]
    }

    before { edges.each { |from, to| graph.add_edge(from, to) } }

    describe("#acyclic?") {
      it("returns true") {
        _(subject.acyclic?).must_equal(true)
      }
    }

    describe("#order") {
      it("returns a topologically ordered path") {
        _(subject.order).must_equal([8, 7, 2, 3, 0, 6, 9, 11, 12, 10, 5, 4, 1])
      }
    }
  }

  describe("when the graph is cyclic") {
    let(:edges) {
      [
        [0, 1],
        [0, 5],
        [0, 6],
        [2, 0],
        [2, 3],
        [3, 5],
        [4, 2],
        [5, 4],
        [6, 4],
        [6, 9],
        [7, 6],
        [8, 7],
        [9, 10],
        [9, 11],
        [9, 12],
        [11, 12]
      ]
    }

    before { edges.each { |from, to| graph.add_edge(from, to) } }

    describe("#acyclic?") {
      it("returns false") {
        _(subject.acyclic?).must_equal(false)
      }
    }

    describe("#order") {
      it("returns nil") {
        _(subject.order).must_be_nil
      }
    }
  }
}
