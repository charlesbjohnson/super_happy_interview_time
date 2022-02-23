# frozen_string_literal: true

module LeetCode
  # 207. Course Schedule
  module LC207
    # Description:
    # There are a total of num_courses courses you have to take, labeled from 0 to num_courses - 1.
    # You are given an array prerequisites where prerequisites[i] = [ai, bi] indicates that you must take course bi first if you want to take course ai.
    #
    # For example, the pair [0, 1], indicates that to take course 0 you have to first take course 1.
    #
    # Return true if you can finish all courses. Otherwise, return false.
    #
    # Examples:
    # Input: num_courses = 2, prerequisites = [[1, 0]]
    # Output: true
    #
    # Input: num_courses = 2, prerequisites = [[1, 0], [0, 1]]
    # Output: false
    #
    # @param {Integer} num_courses
    # @param {Array<Array<(Integer, Integer)>>} prerequisites
    # @return {Boolean}
    def can_finish(num_courses, prerequisites)
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
      end

      dependencies.empty?
    end
  end
end
