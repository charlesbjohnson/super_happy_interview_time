# frozen_string_literal: true

module LeetCode
  # 133. Clone Graph
  module LC133
    Node = Helpers::LeetCode::Graph::Node

    # Description:
    # Given a reference of a node in a connected undirected graph.
    # Return a deep copy (clone) of the graph.
    #
    # Each node in the graph contains a value (int) and a list (List[Node]) of its neighbors.
    #
    # Examples:
    # Input: adj_list = [[2, 4], [1, 3], [2, 4], [1, 3]]
    # Output: [[2, 4], [1, 3], [2, 4], [1, 3]]
    #
    # Input: adj_list = [[]]
    # Output: [[]]
    #
    # Input: adj_list = []
    # Output: []
    #
    # @param {Node} node
    # @return {Node}
    def cloneGraph(node)
      visited = {}

      rec = ->(n) {
        return if !n
        return visited[n] if visited.key?(n)

        visited[n] = Node.new(n.val)
        visited[n].neighbors = n.neighbors.map { |neighbor| rec.call(neighbor) }

        visited[n]
      }

      rec.call(node)
    end

    def clone_graph(node)
      visited = {}
      stack = [[node, false]]

      until stack.empty?
        n, backtrack = stack.pop

        if backtrack
          visited[n].neighbors = n.neighbors.map { |neighbor| visited[neighbor] }
          next
        end

        next if !n
        next if visited.key?(n)

        visited[n] = Node.new(n.val)

        stack.push([n, true])
        n.neighbors.each { |neighbor| stack.push([neighbor, false]) }
      end

      visited[node]
    end
  end
end
