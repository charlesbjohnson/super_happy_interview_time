# frozen_string_literal: true

module Algorithms
  module Graphs
    class TopologicalOrder
      def initialize(graph)
        @graph = graph
      end

      def acyclic?
        @acyclic ||= !Algorithms::Graphs::DirectedCycleDetection.new(@graph).cycle?
      end

      def order
        return unless acyclic?

        @order ||= Algorithms::Graphs::DepthFirstOrder.new(@graph).post.reverse
      end
    end
  end
end
