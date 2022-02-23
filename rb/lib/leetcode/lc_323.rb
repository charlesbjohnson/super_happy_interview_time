# frozen_string_literal: true

module LeetCode
  # 323. Number of Connected Components in an Undirected Graph
  module LC323
    UnionFind = Helpers::LeetCode::UnionFind

    # Description:
    # You have a graph of n nodes.
    # You are given an integer n and an array edges where edges[i] = [ai, bi] indicates that there is an edge between ai and bi in the graph.
    #
    # Return the number of connected components in the graph.
    #
    # Examples:
    #
    # Input: n = 5, edges = [[0, 1], [1, 2], [3, 4]]
    # Output: 2
    #
    # Input: n = 5, edges = [[0, 1], [1, 2], [2, 3], [3, 4]]
    # Output: 1
    #
    # @param {Integer} n
    # @param {Array<Array<Integer>>} edges
    # @return {Integer}
    def count_components(n, edges)
      result = n

      uf = UnionFind.new(result)
      edges.each { |i, j|
        result -= 1 if uf.union(i, j)
      }

      result
    end
  end
end
