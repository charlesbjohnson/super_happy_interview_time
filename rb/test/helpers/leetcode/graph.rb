# frozen_string_literal: true

module Helpers
  module LeetCode
    module Graph
      Node = Struct.new(:val, :neighbors) {
        # @param {Integer} val
        # @param {Array<Node>} neighbors
        def initialize(val, neighbors = [])
          super
        end

        # @param {Node} original
        def initialize_clone(original)
          super
          self.neighbors = original.neighbors.map(&:clone)
        end

        # @param {Node} original
        def initialize_dup(original)
          super
          self.neighbors = original.neighbors.map(&:dup)
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
