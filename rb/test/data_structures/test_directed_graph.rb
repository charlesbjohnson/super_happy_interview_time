# frozen_string_literal: true

require("config")
require("data_structures/directed_graph")

describe(DataStructures::DirectedGraph) {
  subject { DataStructures::DirectedGraph.new }

  it { _(subject).must_respond_to(:size_vertices) }
  it { _(subject).must_respond_to(:size_edges) }
  it { _(subject).must_respond_to(:add_edge) }
  it { _(subject).must_respond_to(:adjacent) }
  it { _(subject).must_respond_to(:reverse) }

  it("starts out empty") {
    _(subject.size_vertices).must_equal(0)
    _(subject.size_edges).must_equal(0)
  }

  describe("#add_edge") {
    it("creates an edge from the first vertex") {
      subject.add_edge(0, 1)
      _(subject.adjacent(0)).must_include(1)
      _(subject.adjacent(1)).wont_include(0)
    }

    it("increments the edges size") {
      subject.add_edge(0, 1)
      _(subject.size_edges).must_equal(1)
      subject.add_edge(0, 2)
      _(subject.size_edges).must_equal(2)
    }

    it { _(subject.add_edge(0, 1)).must_equal(true) }

    describe("with invalid vertices") {
      it("does nothing") {
        subject.add_edge(-1, 0)
        subject.add_edge("not an integer", 0)
        _(subject.size_edges).must_equal(0)
        _(subject.adjacent(0)).must_be_empty
      }

      it { _(subject.add_edge(-1, 0)).must_equal(false) }
    }
  }

  describe("#adjacent") {
    before {
      subject.add_edge(0, 1)
      subject.add_edge(0, 2)
      subject.add_edge(1, 4)
      subject.add_edge(3, 1)
    }

    it("returns all of the vertices adjacent to the target") {
      _(subject.adjacent(0)).must_equal([1, 2])
      _(subject.adjacent(1)).must_equal([4])
      _(subject.adjacent(2)).must_equal([])
      _(subject.adjacent(3)).must_equal([1])
      _(subject.adjacent(4)).must_equal([])
    }

    it("preserves the the adjacency list") {
      subject.adjacent(0).push("not a vertex")
      _(subject.adjacent(0)).must_equal([1, 2])
    }

    describe("with invalid vertex") {
      it("returns nil") {
        _(subject.adjacent(-1)).must_be_nil
        _(subject.adjacent("not a vertex")).must_be_nil
      }
    }
  }

  describe("#reverse") {
    before {
      subject.add_edge(0, 1)
      subject.add_edge(0, 2)
      subject.add_edge(1, 4)
      subject.add_edge(3, 1)
    }

    it("returns a graph with all the edges reversed") {
      reversed = subject.reverse
      _(reversed.adjacent(0)).must_equal([])
      _(reversed.adjacent(1)).must_equal([0, 3])
      _(reversed.adjacent(2)).must_equal([0])
      _(reversed.adjacent(3)).must_equal([])
      _(reversed.adjacent(4)).must_equal([1])
    }
  }
}
