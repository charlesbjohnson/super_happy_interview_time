# typed: true
# frozen_string_literal: true

module LeetCode
  # 207. Course Schedule
  module LC207
    Graph = Struct.new(:length) {
      def initialize(length)
        self.length = length
        @vertices = Array.new(length) { [] }
      end

      def add_edge(from_vertex, to_vertex)
        @vertices[from_vertex].push(to_vertex)
        self
      end

      def adjacent_to(vertex)
        @vertices[vertex]
      end
    }

    def cyclic?(graph)
      visited = Array.new(graph.length, false)

      visited.each_index { |vertex|
        next if visited[vertex]
        return true if cyclic_recurse(graph, visited, vertex, [vertex])
      }

      false
    end

    def cyclic_recurse(graph, visited, vertex, path)
      visited[vertex] = true

      graph.adjacent_to(vertex).each { |adjacent|
        return true if path.include?(adjacent)
        return true if !visited[adjacent] && cyclic_recurse(graph, visited, adjacent, path + [adjacent])
      }

      false
    end

    # Description:
    # There are a total of n courses you have to take, labeled from 0 to n - 1.
    # Some courses may have prerequisites, for example to take course 0 you have to first take course 1, which is expressed as a pair: [0, 1]
    # Given the total number of courses and a list of prerequisite pairs, is it possible for you to finish all courses?
    #
    # Examples:
    #   - 1:
    #     Input: num_courses = 2, prerequisites = [[1, 0]]
    #     Output: true
    #     Explanation: There are a total of 2 courses to take. To take course 1 you should have finished course 0. So it is possible.
    #
    # - 2:
    #   Input: num_courses = 2, prerequisites = [[1, 0], [0, 1]]
    #   Output: false
    #   Explanation: There are a total of 2 courses to take. To take course 1 you should have finished course 0, and to take course 0 you should also have finished course 1. So it is impossible.
    #
    #
    # Notes:
    # - The input prerequisites is a graph represented by a list of edges, not adjacency matrices.
    # - You may assume that there are no duplicate edges in the input prerequisites.
    #
    # @param num_courses {Integer} num_courses
    # @param prerequisites {Array<Array<Integer>>}
    # @return {Boolean}
    def finishable?(num_courses, prerequisites)
      !cyclic?(prerequisites.reduce(Graph.new(num_courses)) { |graph, (course, depends_on)|
        graph.add_edge(course, depends_on)
      })
    end

    alias can_finish finishable?
  end
end
