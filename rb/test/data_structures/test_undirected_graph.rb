# frozen_string_literal: true

require("config")
require("data_structures/undirected_graph")

describe(DataStructures::UndirectedGraph) {
  subject { DataStructures::UndirectedGraph.new }

  it { _(subject).must_respond_to(:size_vertices) }
  it { _(subject).must_respond_to(:size_edges) }
  it { _(subject).must_respond_to(:add_edge) }
  it { _(subject).must_respond_to(:adjacent) }

  it("starts out empty") {
    _(subject.size_vertices).must_equal(0)
    _(subject.size_edges).must_equal(0)
  }

  describe("#add_edge") {
    it("creates an edge for both vertices") {
      subject.add_edge(0, 1)
      _(subject.adjacent(0)).must_include(1)
      _(subject.adjacent(1)).must_include(0)
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
      _(subject.adjacent(1)).must_equal([0, 4, 3])
      _(subject.adjacent(2)).must_equal([0])
      _(subject.adjacent(3)).must_equal([1])
      _(subject.adjacent(4)).must_equal([1])
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
}
