# frozen_string_literal: true

module LeetCode
  # 210. Course Schedule II
  module LC210
    # Description:
    # There are a total of num_courses courses you have to take, labeled from 0 to num_courses - 1.
    # You are given an array prerequisites where prerequisites[i] = [ai, bi] indicates that you must take course bi first if you want to take course ai.
    #
    # For example, the pair [0, 1], indicates that to take course 0 you have to first take course 1.
    #
    # Return the ordering of courses you should take to finish all courses.
    # If there are many valid answers, return any of them. If it is impossible to finish all courses, return an empty array.
    #
    # Examples:
    # Input: num_courses = 2, prerequisites = [[1, 0]]
    # Output: [0, 1]
    #
    # Input: num_courses = 4, prerequisites = [[1, 0], [2, 0], [3, 1], [3, 2]]
    # Output: [0, 2, 1, 3]
    #
    # Input: num_courses = 1, prerequisites = []
    # Output: [0]
    #
    # @param {Integer} num_courses
    # @param {Array<Array<(Integer, Integer)>>} prerequisites
    # @return {Array<Integer>}
    def find_order(num_courses, prerequisites)
      result = []

      dependencies = {}
      dependents = {}

      (0...num_courses).each { |node|
        dependencies[node] = Set.new
        dependents[node] = []
      }

      prerequisites.each { |course, depends_on|
        dependencies[course].add(depends_on)
        dependents[depends_on].push(course)
      }

      queue = []
      dependencies.each { |node, deps|
        queue.push(node) if deps.empty?
      }

      until queue.empty?
        node = queue.shift

        dependents[node].each { |dep|
          dependencies[dep].delete(node)
          queue.push(dep) if dependencies[dep].empty?
        }

        dependencies.delete(node)
        result.push(node)
      end

      dependencies.empty? ? result : []
    end
  end
end
