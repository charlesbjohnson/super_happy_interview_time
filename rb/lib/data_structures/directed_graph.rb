# frozen_string_literal: true

module DataStructures
  class DirectedGraph
    def initialize
      @table = []
      @edge_length = 0
    end

    def size_vertices
      @table.length
    end

    def size_edges
      @edge_length
    end

    def add_edge(from, to)
      return false unless [from, to].all?(Numeric)
      return false if [from, to].any?(&:negative?)

      from_vertex = @table[from] ||= []
      from_vertex.push(to)

      @edge_length += 1
      true
    end

    def adjacent(target)
      return unless target.is_a?(Numeric) && target >= 0

      @table[target].to_a.clone
    end

    def reverse
      reversed = DirectedGraph.new
      size_vertices.times { |to|
        adjacent(to).each { |from|
          reversed.add_edge(from, to)
        }
      }

      reversed
    end
  end
end
