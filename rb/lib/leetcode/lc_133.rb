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
    def clone_graph(node)
      stack = []
      visited = {}

      stack.push(node) if node

      until stack.empty?
        current = stack.pop

        visited[current] ||= Node.new(current.val)
        current.neighbors.each { |neighbor|
          if !visited.key?(neighbor)
            visited[neighbor] = Node.new(neighbor.val)
            stack.push(neighbor)
          end

          visited[current].neighbors.push(visited[neighbor])
        }
      end

      visited[node]
    end
  end
end
