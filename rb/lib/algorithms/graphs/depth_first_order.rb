# frozen_string_literal: true

module Algorithms
  module Graphs
    class DepthFirstOrder
      def initialize(graph)
        @graph = graph
        execute
      end

      def pre
        @pre.clone
      end

      def post
        @post.clone
      end

      private

      def execute
        @marked = Array.new(@graph.size_vertices) { false }
        @pre = []
        @post = []
        @marked.each_with_index { |was_visited, v|
          r_execute(v) unless was_visited
        }
      end

      def r_execute(from)
        @pre.push(from)

        @marked[from] = true
        @graph.adjacent(from).each { |to|
          r_execute(to) unless @marked[to]
        }

        @post.push(from)
      end
    end
  end
end
