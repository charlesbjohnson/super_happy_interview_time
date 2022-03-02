# frozen_string_literal: true

module LeetCode
  # 265. Paint House II
  module LC265
    # Description:
    # There are a row of n houses, each house can be painted with one of the k colors.
    # The cost of painting each house with a certain color is different.
    # You have to paint all the houses such that no two adjacent houses have the same color.
    #
    # The cost of painting each house with a certain color is represented by an n x k cost matrix costs.
    # - For example, costs[0][0] is the cost of painting house 0 with color 0; costs[1][2] is the cost of painting house 1 with color 2, and so on...
    #
    # Return the minimum cost to paint all houses.
    #
    # Examples:
    # Input: costs = [[1, 5, 3], [2, 9, 4]]
    # Output: 5
    #
    # Input: costs = [[1, 3], [2, 4]]
    # Output: 5
    #
    # @param {Integer[][]} costs
    # @return {Integer}
    def min_cost_ii(costs)
      result = private_methods.grep(/^min_cost_ii_\d+$/).map { |m| send(m, costs) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def min_cost_ii_1(costs)
      cache = {}

      rec = ->(i, c) {
        return 0 if i == costs.length

        cache[[i, c]] ||= costs[i].each_with_index.map { |cost, color|
          c != color ? cost + rec.call(i + 1, color) : Float::INFINITY
        }.min
      }

      rec.call(0, -1)
    end

    def min_cost_ii_2(costs)
      n = costs.length
      k = costs[0].length

      result = Array.new(n + 1) { |i| Array.new(k) { i == n ? 0 : Float::INFINITY } }

      (n - 1).downto(0) { |i|
        (0...k).each { |c|
          result[i][c] = costs[i].each_with_index.map { |cost, color|
            c != color ? cost + result[i + 1][color] : Float::INFINITY
          }.min
        }
      }

      result[0].min
    end

    def min_cost_ii_3(costs)
      n = costs.length
      k = costs[0].length

      result = Array.new(n + 1) { |i| Array.new(k) { i == n ? 0 : Float::INFINITY } }

      (n - 1).downto(0) { |i|
        mins = [0, 1]

        if result[i + 1][mins[1]] < result[i + 1][mins[0]]
          mins[0], mins[1] = mins[1], mins[0]
        end

        (2...k).each { |c|
          if result[i + 1][c] < result[i + 1][mins[0]]
            mins[0], mins[1] = c, mins[0]
          elsif result[i + 1][c] < result[i + 1][mins[1]]
            mins[1] = c
          end
        }

        (0...k).each { |c|
          result[i][c] = costs[i][c] + result[i + 1][c != mins[0] ? mins[0] : mins[1]]
        }
      }

      result[0].min
    end
  end
end
