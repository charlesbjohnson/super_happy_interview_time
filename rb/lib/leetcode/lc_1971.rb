# frozen_string_literal: true

module LeetCode
  # 1971. Find if Path Exists in Graph
  module LC1971
    # Description:
    # There is a bi-directional graph with n vertices, where each vertex is labeled from 0 to n - 1 (inclusive).
    # The edges in the graph are represented as a 2D integer array edges, where each edges[i] = [ui, vi] denotes a bi-directional edge between vertex ui and vertex vi.
    # Every vertex pair is connected by at most one edge, and no vertex has an edge to itself.
    #
    # You want to determine if there is a valid path that exists from vertex source to vertex destination.
    #
    # Given edges and the integers n, source, and destination, return true if there is a valid path from source to destination, or false otherwise.
    #
    # Examples:
    # Input: n = 3, edges = [[0, 1], [1, 2], [2, 0]], source = 0, destination = 2
    # Output: true
    #
    # Input: n = 6, edges = [[0, 1], [0, 2], [3, 5], [5, 4], [4, 3]], source = 0, destination = 5
    # Output: false
    #
    # @param {Integer} n
    # @param {Array<Array<(Integer, Integer)>>} edges
    # @param {Integer} source
    # @param {Integer} destination
    # @return {Boolean}
    def valid_path(n, edges, source, destination)
      visited = Array.new(n, false)
      graph = edges.each_with_object(Array.new(n) { [] }) { |(a, b), g|
        g[a].push(b)
        g[b].push(a)
      }

      stack = [source]

      until stack.empty?
        node = stack.pop

        return true if node == destination

        next if visited[node]
        visited[node] = true

        graph[node].each { |neighbor|
          stack.push(neighbor)
        }
      end

      false
    end
  end
end
