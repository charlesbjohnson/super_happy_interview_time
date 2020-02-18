# frozen_string_literal: true

require 'config'

require 'algorithms/graph_processing/undirected_cycle_detection'
require 'data_structures/undirected_graph'

describe Algorithms::GraphProcessing::UndirectedCycleDetection do
  subject { Algorithms::GraphProcessing::UndirectedCycleDetection.new(graph) }

  let(:graph) { DataStructures::UndirectedGraph.new }

  it { _(subject).must_respond_to :cycle? }
  it { _(subject).must_respond_to :cycle }

  describe 'when there is a cycle' do
    let(:edges) do
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
    end

    before { edges.each { |from, to| graph.add_edge(from, to) } }

    describe '#cycle?' do
      it 'returns true' do
        _(subject.cycle?).must_equal(true)
      end
    end

    describe '#cycle' do
      it 'returns the cycle' do
        _(subject.cycle).must_equal([6, 7, 8, 6])
      end
    end
  end

  describe 'when there is no cycle' do
    let(:edges) do
      [
        [0, 1],
        [0, 2],
        [1, 3],
        [1, 4],
        [2, 5],
        [2, 6]
      ]
    end

    before { edges.each { |from, to| graph.add_edge(from, to) } }

    describe '#cycle?' do
      it 'returns false' do
        _(subject.cycle?).must_equal(false)
      end
    end

    describe '#cycle' do
      it 'returns nil' do
        _(subject.cycle).must_be_nil
      end
    end
  end
end
