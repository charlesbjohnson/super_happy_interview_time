# frozen_string_literal: true

module LeetCode
  # 399. Evaluate Division
  module LC399
    # Description:
    # You are given an array of variable pairs equations and an array of real numbers values, where equations[i] = [Ai, Bi] and values[i] represent the equation Ai / Bi = values[i].
    # Each Ai or Bi is a string that represents a single variable.
    #
    # You are also given some queries, where queries[j] = [Cj, Dj] represents the jth query where you must find the answer for Cj / Dj = ?.
    #
    # Return the answers to all queries. If a single answer cannot be determined, return -1.0.
    #
    # Note: The input is always valid. You may assume that evaluating the queries will not result in division by zero and that there is no contradiction.
    #
    # Examples:
    # Input: equations = [["a", "b"], ["b", "c"]], values = [2.0, 3.0], queries = [["a", "c"], ["b", "a"], ["a", "e"], ["a", "a"], ["x", "x"]]
    # Output: [6.00000, 0.50000, -1.00000, 1.00000, -1.00000]
    #
    # Input: equations = [["a", "b"], ["b", "c"], ["bc", "cd"]], values = [1.5, 2.5, 5.0], queries = [["a", "c"], ["c", "b"], ["bc", "cd"], ["cd", "bc"]]
    # Output: [3.75000, 0.40000, 5.00000, 0.20000]
    #
    # Input: equations = [["a", "b"]], values = [0.5], queries = [["a", "b"], ["b", "a"], ["a", "c"], ["x", "y"]]
    # Output: [0.50000, 2.00000, -1.00000, -1.00000]
    #
    # @param {Array<Array<(String, String)>>} equations
    # @param {Array<Float>} values
    # @param {Array<Array<(String, String)>>} queries
    # @return {Array<Float>}
    def calc_equation(equations, values, queries)
      graph = equations.each_with_object(Hash.new { |h, k| h[k] = {} }).with_index { |((dividend, divisor), g), i|
        quotient = values[i]
        g[dividend][divisor] = quotient
        g[divisor][dividend] = 1 / quotient
      }

      queries.map { |dividend, divisor|
        calculate(graph, dividend, divisor)
      }
    end

    private

    def calculate(graph, from, to)
      stack = []
      visited = Set.new

      stack.push([from, 1.0]) if graph.key?(from)

      until stack.empty?
        node, value = stack.pop

        return value if node == to
        next if !visited.add?(node)

        graph[node].each { |k, v|
          stack.push([k, v * value])
        }
      end

      -1.0
    end
  end
end
