# frozen_string_literal: true

module LeetCode
  # 70. Climbing Stairs
  module LC70
    # Description:
    # You are climbing a stair case. It takes n steps to reach to the top.
    # Each time you can either climb 1 or 2 steps.
    #
    # In how many distinct ways can you climb to the top?
    #
    # Examples:
    # Input: n = 2
    # Output: 2
    #
    # Input: n = 3
    # Output: 3
    #
    # @param {Integer} n
    # @return {Integer}
    def climb_stairs(n)
      result = Array.new(n)

      result[0] = 1
      result[1] = 2 if result.length > 1

      (2...result.length).each { |i|
        result[i] = result[(i - 2)...i].sum
      }

      result[-1]
    end
  end
end
