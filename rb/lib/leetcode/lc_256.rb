# frozen_string_literal: true

module LeetCode
  # 256. Paint House
  module LC256
    # Description:
    # There is a row of n houses, where each house can be painted one of three colors: red, blue, or green.
    # The cost of painting each house with a certain color is different.
    # You have to paint all the houses such that no two adjacent houses have the same color.
    #
    # The cost of painting each house with a certain color is represented by an n x 3 cost matrix costs.
    # - For example, costs[0][0] is the cost of painting house 0 with the color red; costs[1][2] is the cost of painting house 1 with color green, and so on...
    #
    # Return the minimum cost to paint all houses.
    #
    # Examples:
    # Input: costs = [[17, 2, 17], [16, 16, 5], [14, 3, 19]]
    # Output: 10
    #
    # Input: costs = [[7, 6, 2]]
    # Output: 2
    #
    # @param {Array<Array<Integer>>} costs
    # @return {Integer}
    def min_cost(costs)
      result = private_methods.grep(/^min_cost_\d+$/).map { |m| send(m, costs) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def min_cost_1(costs)
      cache = {}

      rec = ->(i, c) {
        return 0 if i == costs.length

        cache[[i, c]] ||= [
          c != 0 ? costs[i][0] + rec.call(i + 1, 0) : Float::INFINITY,
          c != 1 ? costs[i][1] + rec.call(i + 1, 1) : Float::INFINITY,
          c != 2 ? costs[i][2] + rec.call(i + 1, 2) : Float::INFINITY
        ].min
      }

      (0..2).map { |c| rec.call(0, c) }.min
    end

    def min_cost_2(costs)
      result = Array.new(costs.length + 1) { |i| Array.new(3) { i == costs.length ? 0 : Float::INFINITY } }

      (costs.length - 1).downto(0) { |i|
        (0..2).each { |c|
          result[i][c] = [
            c != 0 ? costs[i][0] + result[i + 1][0] : Float::INFINITY,
            c != 1 ? costs[i][1] + result[i + 1][1] : Float::INFINITY,
            c != 2 ? costs[i][2] + result[i + 1][2] : Float::INFINITY
          ].min
        }
      }

      result[0].min
    end
  end
end
