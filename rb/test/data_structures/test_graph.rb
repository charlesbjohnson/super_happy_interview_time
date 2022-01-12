# frozen_string_literal: true

require("config")
require("data_structures/graph")

describe(DataStructures::Graph) {
  subject { DataStructures::Graph.new }

  it { _(subject).must_respond_to(:size_vertices) }
  it { _(subject).must_respond_to(:size_edges) }
  it { _(subject).must_respond_to(:get) }
  it { _(subject).must_respond_to(:adjacent) }
  it { _(subject).must_respond_to(:add_vertex) }
  it { _(subject).must_respond_to(:add_edge) }

  let(:foo) { "foo" }

  it("starts out with no vertices and no edges") {
    _(subject.size_vertices).must_equal(0)
    _(subject.size_edges).must_equal(0)
  }

  describe("#get") {
    it("returns the data for a vertex index") {
      subject.add_vertex(foo)
      _(subject.get(0)).must_equal(foo)
    }

    it("returns nil for nonexistent vertex") {
      _(subject.get(0)).must_be_nil
    }
  }

  describe("#adjacent") {
    it("returns nil for nonexistent vertex") {
      _(subject.adjacent(0)).must_be_nil
    }

    it("returns the vertices pointed to by a given vertex") {
      subject.add_vertex(foo)
      subject.add_vertex("bar")
      subject.add_vertex("baz")
      subject.add_edge(0, 1)
      subject.add_edge(1, 2)
      subject.add_edge(2, 0)

      _(subject.adjacent(0)).must_equal([[1, "bar"]])
      _(subject.adjacent(1)).must_equal([[2, "baz"]])
      _(subject.adjacent(2)).must_equal([[0, foo]])
    }
  }

  describe("#add_vertex") {
    it("creates a vertex in the graph") {
      subject.add_vertex(foo)

      _(subject.get(0)).must_equal(foo)
      _(subject.size_vertices).must_equal(1)
      _(subject.adjacent(0)).must_equal([])
    }
  }

  describe("#add_edge") {
    it("creates an edge in the graph between two vertices") {
      subject.add_vertex("bar")
      subject.add_vertex(foo)
      subject.add_edge(0, 1)

      _(subject.size_edges).must_equal(1)
      _(subject.adjacent(0)).must_equal([[1, foo]])
    }

    describe("with invalid vertices") {
      it("doesnt create an edge on nonexistent vertices") {
        subject.add_vertex(foo)
        subject.add_edge(0, 1)

        _(subject.size_edges).must_equal(0)
        _(subject.adjacent(0)).must_equal([])
      }
    }
  }
}
