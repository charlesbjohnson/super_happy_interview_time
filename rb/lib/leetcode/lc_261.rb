# frozen_string_literal: true

module LeetCode
  # 261. Graph Valid Tree
  module LC261
    UnionFind = Helpers::LeetCode::UnionFind

    # Description:
    # You have a graph of n nodes labeled from 0 to n - 1.
    # You are given an integer n and a list of edges where edges[i] = [ai, bi] indicates that there is an undirected edge between nodes ai and bi in the graph.
    #
    # Return true if the edges of the given graph make up a valid tree, and false otherwise.
    #
    # Examples:
    # Input: n = 5, edges = [[0, 1], [0, 2], [0, 3], [1, 4]]
    # Output: true
    #
    #
    # Input: n = 5, edges = [[0, 1], [1, 2], [2, 3], [1, 3], [1, 4]]
    # Output: false
    #
    # @param {Integer} n
    # @param {Array<Array<Integer>>} edges
    # @return {Boolean}
    def valid_tree(n, edges)
      return false if edges.length != n - 1

      uf = UnionFind.new(n)
      edges.each { |i, j|
        return false if !uf.union(i, j)
      }

      true
    end
  end
end
