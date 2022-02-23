# frozen_string_literal: true

module LeetCode
  # 1059. All Paths from Source Lead to Destination
  module LC1059
    # Description:
    # Given the edges of a directed graph where edges[i] = [ai, bi] indicates there is an edge between nodes ai and bi, and two nodes source and destination of this graph,
    # determine whether or not all paths starting from source eventually, end at destination, that is:
    # - At least one path exists from the source node to the destination node
    # - If a path exists from the source node to a node with no outgoing edges, then that node is equal to destination.
    # - The number of possible paths from source to destination is a finite number.
    #
    # Return true if and only if all roads from source lead to destination.
    #
    # Examples:
    # Input: n = 3, edges = [[0, 1], [0, 2]], source = 0, destination = 2
    # Output: false
    #
    # Input: n = 4, edges = [[0, 1], [0, 3], [1, 2], [2, 1]], source = 0, destination = 3
    # Output: false
    #
    # @param {Integer} n
    # @param {Array<Array<(Integer, Integer)>>} edges
    # @param {Integer} source
    # @param {Integer} destination
    # @return {Boolean}
    def leads_to_destination(n, edges, source, destination)
      visited = Array.new(n, false)
      graph = edges.each_with_object(Array.new(n) { [] }) { |(from, to), g|
        g[from].push(to)
      }

      stack = [[source, false]]

      until stack.empty?
        node, backtrack = stack.pop

        if backtrack
          visited[node] = false
          next
        end

        return false if visited[node]
        return false if graph[node].empty? && node != destination

        visited[node] = true
        stack.push([node, true])

        graph[node].each { |neighbor|
          stack.push([neighbor, false])
        }
      end

      true
    end
  end
end
