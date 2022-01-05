# frozen_string_literal: true

module Helpers
  module LeetCode
    module Graph
      Node = Struct.new(:val, :neighbors) {
        def initialize(val, neighbors = nil)
          self.val = val
          self.neighbors = neighbors || []
        end
      }

      # @param {Array<Array<Integer>>} values
      # @return {Node}
      def build_graph(values)
        nodes = values.each_with_index.with_object(Array.new(values.length)) { |(edges, i), nodes|
          nodes[i] ||= Node.new(i + 1)

          edges.each { |edge|
            nodes[i].neighbors.push(nodes[edge - 1] ||= Node.new(edge))
          }
        }

        nodes.first
      end
    end
  end
end
