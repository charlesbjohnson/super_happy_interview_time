# frozen_string_literal: true

module LeetCode
  # 797. All Paths From Source to Target
  module LC797
    # Description:
    # Given a directed acyclic graph (DAG) of n nodes labeled from 0 to n - 1,
    # find all possible paths from node 0 to node n - 1 and return them in any order.
    #
    # The graph is given as follows: graph[i] is a list of all nodes you can visit from node i (i.e., there is a directed edge from node i to node graph[i][j]).
    #
    # Examples:
    # Input: graph = [[1, 2], [3], [3], []]
    # Output: [[0, 1, 3], [0, 2, 3]]
    #
    # Input: graph = [[4, 3, 1], [3, 2, 4], [3], [4], []]
    # Output: [[0, 4], [0, 3, 4], [0, 1, 3, 4], [0, 1, 2, 3, 4], [0, 1, 4]]
    #
    # @param {Array<Array<Integer>>} graph
    # @return {Array<Array<Integer>>}
    def all_paths_source_target(graph)
      result = []
      stack = [[0, []]]

      until stack.empty?
        node, path = stack.pop

        if node == graph.length - 1
          result.unshift(path + [node])
          next
        end

        graph[node].each { |neighbor|
          stack.push([neighbor, path + [node]])
        }
      end

      result
    end
  end
end
