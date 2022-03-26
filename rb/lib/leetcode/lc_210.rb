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
      result = private_methods.grep(/^find_order_\d+$/).map { |m| send(m, num_courses, prerequisites) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def find_order_1(num_courses, prerequisites)
      result = []

      graph = (0...num_courses).each_with_object({}) { |i, h| h[i] = [] }
      prerequisites.each { |a, b| graph[b].push(a) }

      path = Set.new

      rec = ->(node) {
        return true if !graph.key?(node)

        return false if !path.add?(node)
        return false if !graph[node].reverse_each.all? { |neighbor| rec.call(neighbor) }

        graph.delete(node)
        path.delete(node)

        result.unshift(node)

        true
      }

      (0...num_courses).all? { |i| rec.call(i) }
      result.length == num_courses ? result : []
    end

    def find_order_2(num_courses, prerequisites)
      result = []

      graph = (0...num_courses).each_with_object({}) { |i, h| h[i] = [] }
      prerequisites.each { |a, b| graph[b].push(a) }

      path = Set.new

      search = ->(source) {
        stack = [[source, false]]

        until stack.empty?
          node, backtrack = stack.pop

          if backtrack
            graph.delete(node)
            path.delete(node)
            result.unshift(node)
            next
          end

          return false if !path.add?(node)

          if !graph.key?(node)
            path.delete(node)
            next
          end

          stack.push([node, true])
          graph[node].each { |neighbor|
            stack.push([neighbor, false])
          }
        end

        true
      }

      (0...num_courses).all? { |i| search.call(i) }
      result.length == num_courses ? result : []
    end

    def find_order_3(num_courses, prerequisites)
      result = []

      dependencies = {}
      dependents = {}

      (0...num_courses).each { |i|
        dependencies[i] = Set.new
        dependents[i] = []
      }

      prerequisites.each { |a, b|
        dependencies[a].add(b)
        dependents[b].push(a)
      }

      queue = dependencies.each_key.filter { |k| dependencies[k].empty? }

      until queue.empty?
        node = queue.shift

        dependents[node].each { |dependent|
          dependencies[dependent].delete(node)
          queue.push(dependent) if dependencies[dependent].empty?
        }

        dependencies.delete(node)
        result.push(node)
      end

      result.length == num_courses ? result : []
    end
  end
end
