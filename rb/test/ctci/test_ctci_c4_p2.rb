# typed: true
# frozen_string_literal: true

require 'config'

require 'data_structures/graph'
require 'ctci/ctci_c4_p2'

module CTCI
  module C4
    class TestP2 < Minitest::Test
      Graph = DataStructures::Graph.dup.class_exec do
        include P2
      end

      def setup
        @graph = Graph.new
      end

      def test_returns_true_if_connected
        4.times { |i| @graph.add_vertex(i.to_s) }
        @graph.add_edge(0, 1)
        @graph.add_edge(0, 3)
        @graph.add_edge(1, 2)
        @graph.add_edge(2, 0)
        @graph.add_edge(2, 3)
        @graph.add_edge(3, 0)

        assert @graph.connected?(1, 3)
      end

      def test_returns_false_if_not_connected
        4.times { |i| @graph.add_vertex(i.to_s) }
        @graph.add_edge(0, 1)
        @graph.add_edge(0, 3)
        @graph.add_edge(1, 2)
        @graph.add_edge(2, 0)
        @graph.add_edge(2, 3)

        refute @graph.connected?(3, 1)
      end

      def test_returns_false_on_nonexistent_vertices
        refute @graph.connected?(0, 1)
      end
    end
  end
end
