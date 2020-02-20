# typed: false
# frozen_string_literal: true

require 'config'
require 'data_structures/directed_graph'

describe DataStructures::DirectedGraph do
  subject { DataStructures::DirectedGraph.new }

  it { _(subject).must_respond_to :size_vertices }
  it { _(subject).must_respond_to :size_edges }
  it { _(subject).must_respond_to :add_edge }
  it { _(subject).must_respond_to :adjacent }
  it { _(subject).must_respond_to :reverse }

  it 'starts out empty' do
    _(subject.size_vertices).must_equal(0)
    _(subject.size_edges).must_equal(0)
  end

  describe '#add_edge' do
    it 'creates an edge from the first vertex' do
      subject.add_edge(0, 1)
      _(subject.adjacent(0)).must_include(1)
      _(subject.adjacent(1)).wont_include(0)
    end

    it 'increments the edges size' do
      subject.add_edge(0, 1)
      _(subject.size_edges).must_equal(1)
      subject.add_edge(0, 2)
      _(subject.size_edges).must_equal(2)
    end

    it { _(subject.add_edge(0, 1)).must_equal(true) }

    describe 'with invalid vertices' do
      it 'does nothing' do
        subject.add_edge(-1, 0)
        subject.add_edge('not an integer', 0)
        _(subject.size_edges).must_equal(0)
        _(subject.adjacent(0)).must_be_empty
      end

      it { _(subject.add_edge(-1, 0)).must_equal(false) }
    end
  end

  describe '#adjacent' do
    before do
      subject.add_edge(0, 1)
      subject.add_edge(0, 2)
      subject.add_edge(1, 4)
      subject.add_edge(3, 1)
    end

    it 'returns all of the vertices adjacent to the target' do
      _(subject.adjacent(0)).must_equal([1, 2])
      _(subject.adjacent(1)).must_equal([4])
      _(subject.adjacent(2)).must_equal([])
      _(subject.adjacent(3)).must_equal([1])
      _(subject.adjacent(4)).must_equal([])
    end

    it 'preserves the the adjacency list' do
      subject.adjacent(0).push('not a vertex')
      _(subject.adjacent(0)).must_equal([1, 2])
    end

    describe 'with invalid vertex' do
      it 'returns nil' do
        _(subject.adjacent(-1)).must_be_nil
        _(subject.adjacent('not a vertex')).must_be_nil
      end
    end
  end

  describe '#reverse' do
    before do
      subject.add_edge(0, 1)
      subject.add_edge(0, 2)
      subject.add_edge(1, 4)
      subject.add_edge(3, 1)
    end

    it 'returns a graph with all the edges reversed' do
      reversed = subject.reverse
      _(reversed.adjacent(0)).must_equal([])
      _(reversed.adjacent(1)).must_equal([0, 3])
      _(reversed.adjacent(2)).must_equal([0])
      _(reversed.adjacent(3)).must_equal([])
      _(reversed.adjacent(4)).must_equal([1])
    end
  end
end
