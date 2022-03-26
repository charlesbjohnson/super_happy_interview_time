# frozen_string_literal: true

module LeetCode
  # 746. Min Cost Climbing Stairs
  module LC746
    # Description:
    # You are given an integer array cost where cost[i] is the cost of ith step on a staircase.
    # Once you pay the cost, you can either climb one or two steps.
    #
    # You can either start from the step with index 0, or the step with index 1.
    #
    # Return the minimum cost to reach the top of the floor.
    #
    # Examples:
    # Input: cost = [10, 15, 20]
    # Output: 15
    #
    # Input: cost = [1, 100, 1, 1, 1, 100, 1, 1, 100, 1]
    # Output: 6
    #
    # @param {Array<Integer>} cost
    # @return {Integer}
    def min_cost_climbing_stairs(cost)
      result = private_methods.grep(/^min_cost_climbing_stairs_\d+$/).map { |m| send(m, cost) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def min_cost_climbing_stairs_1(cost)
      cache = {}

      rec = ->(i) {
        return 0 if i < 2

        cache[i] ||= [
          cost[i - 2] + rec.call(i - 2),
          cost[i - 1] + rec.call(i - 1)
        ].min
      }

      rec.call(cost.length)
    end

    def min_cost_climbing_stairs_2(cost)
      cache = Array.new(cost.length + 1, 0)

      (2..cost.length).each { |i|
        cache[i] = [
          cost[i - 1] + cache[i - 1],
          cost[i - 2] + cache[i - 2]
        ].min
      }

      cache[cost.length]
    end
  end
end
