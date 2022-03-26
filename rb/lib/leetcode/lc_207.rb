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
      result = private_methods.grep(/^can_finish_\d+$/).map { |m| send(m, num_courses, prerequisites) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def can_finish_1(num_courses, prerequisites)
      graph = (0...num_courses).each_with_object({}) { |i, h| h[i] = [] }
      prerequisites.each { |a, b|
        graph[b].push(a)
      }

      path = Set.new

      rec = ->(node) {
        return false if !path.add?(node)
        return true if !graph.key?(node)
        return false if !graph[node].all? { |neighbor| rec.call(neighbor) }

        graph.delete(node)
        path.delete(node)

        true
      }

      (0...num_courses).all? { |i| rec.call(i) }
    end

    def can_finish_2(num_courses, prerequisites)
      graph = (0...num_courses).each_with_object({}) { |i, h| h[i] = [] }
      prerequisites.each { |a, b|
        graph[b].push(a)
      }

      path = Set.new

      search = ->(source) {
        stack = [[source, false]]

        until stack.empty?
          node, backtrack = stack.pop

          if backtrack
            graph.delete(node)
            path.delete(node)
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
    end

    def can_finish_3(num_courses, prerequisites)
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
      end

      dependencies.empty?
    end
  end
end
