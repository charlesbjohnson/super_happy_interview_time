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
    # Input: adjList = [[2, 4], [1, 3], [2, 4], [1, 3]]
    # Output: [[2, 4], [1, 3], [2, 4], [1, 3]]
    #
    # Input: adjList = [[]]
    # Output: [[]]
    #
    # Input: adjList = []
    # Output: []
    #
    # @param {Node} node
    # @return {Node}
    def clone_graph(node)
      r_clone_graph(node, {}) if node
    end

    def r_clone_graph(node, visited)
      return visited[node] if visited.key?(node)

      visited[node] = Node.new(node.val)
      visited[node].neighbors = node.neighbors.map { |neighbor| r_clone_graph(neighbor, visited) }

      visited[node]
    end
  end
end
