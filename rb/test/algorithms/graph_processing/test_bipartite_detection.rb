# frozen_string_literal: true

require 'config'

require 'algorithms/graph_processing/bipartite_detection'
require 'data_structures/undirected_graph'

describe Algorithms::GraphProcessing::BipartiteDetection do
  subject { Algorithms::GraphProcessing::BipartiteDetection.new(graph) }

  let(:graph) { DataStructures::UndirectedGraph.new }

  it { _(subject).must_respond_to :bipartite? }

  describe '#bipartite?' do
    describe 'when the graph is bipartite' do
      let(:edges) do
        [
          [0, 1],
          [0, 2],
          [0, 5],
          [0, 6],
          [1, 3],
          [2, 3],
          [2, 4],
          [5, 4],
          [6, 4],
          [7, 8],
          [7, 9]
        ]
      end

      before { edges.each { |from, to| graph.add_edge(from, to) } }

      it 'returns true' do
        _(subject.bipartite?).must_equal(true)
      end
    end

    describe 'when the graph is not bipartite' do
      let(:edges) do
        [
          [0, 1],
          [0, 2],
          [0, 4],
          [1, 3],
          [2, 3],
          [2, 4]
        ]
      end

      before { edges.each { |from, to| graph.add_edge(from, to) } }

      it 'returns false' do
        _(subject.bipartite?).must_equal(false)
      end
    end
  end
end
