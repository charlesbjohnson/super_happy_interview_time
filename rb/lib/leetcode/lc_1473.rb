# frozen_string_literal: true

module LeetCode
  # 1473. Paint House III
  module LC1473
    # Description:
    # There is a row of m houses in a small city, each house must be painted with one of the n colors (labeled from 1 to n),
    # some houses that have been painted last summer should not be painted again.
    #
    # A neighborhood is a maximal group of continuous houses that are painted with the same color.
    # - For example: houses = [1,2,2,3,3,2,1,1] contains 5 neighborhoods [{1}, {2,2}, {3,3}, {2}, {1,1}].
    #
    # Given an array houses, an m x n matrix cost and an integer target where:
    # - houses[i]: is the color of the house i, and 0 if the house is not painted yet.
    # - cost[i][j]: is the cost of paint the house i with the color j + 1.
    #
    # Return the minimum cost of painting all the remaining houses in such a way that there are exactly target neighborhoods.
    # If it is not possible, return -1.
    #
    # Examples:
    # Input: houses = [0, 0, 0, 0, 0], cost = [[1, 10], [10, 1], [10, 1], [1, 10], [5, 1]], m = 5, n = 2, target = 3
    # Output: 9
    #
    # Input: houses = [0, 2, 1, 2, 0], cost = [[1, 10], [10, 1], [10, 1], [1, 10], [5, 1]], m = 5, n = 2, target = 3
    # Output: 11
    #
    # Input: houses = [3, 1, 2, 3], cost = [[1, 1, 1], [1, 1, 1], [1, 1, 1], [1, 1, 1]], m = 4, n = 3, target = 3
    # Output: -1
    #
    # @param {Array<Integer>} houses
    # @param {Array<Array<Integer>>} cost
    # @param {Integer} m
    # @param {Integer} n
    # @param {Integer} target
    # @return {Integer}
    def min_cost(houses, cost, m, n, target)
      result = private_methods.grep(/^min_cost_\d+$/).map { send(_1, houses.clone, cost, m, n, target) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def min_cost_1(houses, cost, m, n, target)
      houses.each_index { |i| houses[i] -= 1 }
      cache = {}

      rec = ->(i, c, t) {
        return Float::INFINITY if t > target
        return (t == target ? 0 : Float::INFINITY) if i == m

        cache[[i, c, t]] ||= if houses[i] == -1
          cost[i].each_with_index.map { |cost, color|
            cost + rec.call(i + 1, color, t + (c == color ? 0 : 1))
          }.min
        else
          rec.call(i + 1, houses[i], t + (c == houses[i] ? 0 : 1))
        end
      }

      result = rec.call(0, -1, 0)
      result.infinite? ? -1 : result
    end

    def min_cost_2(houses, cost, m, n, target)
      houses.each_index { |i| houses[i] -= 1 }

      result = Array.new(m + 1) { Array.new(target + 2) { Array.new(n, Float::INFINITY) } }
      (0...n).each { |c|
        result[m][target - 1][c] = 0
      }

      (m - 1).downto(0) { |i|
        ((i - 1).clamp(0, target - 1)).downto(0) { |t|
          (0...n).each { |c|
            result[i][t][c] = if houses[i] == -1
              cost[i].each_with_index.map { |cost, color|
                cost + result[i + 1][t + (c == color ? 0 : 1)][color]
              }.min
            else
              result[i + 1][t + (c == houses[i] ? 0 : 1)][houses[i]]
            end
          }
        }
      }

      result = result[0][0].min
      result.infinite? ? -1 : result
    end
  end
end
