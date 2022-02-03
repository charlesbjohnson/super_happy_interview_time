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
      r_climb_stairs(n, {})
    end

    private

    def r_climb_stairs(n, cache)
      return 0 if n < 0
      return 1 if n == 0

      if !cache.key?(n)
        cache[n] = r_climb_stairs(n - 2, cache) + r_climb_stairs(n - 1, cache)
      end

      cache[n]
    end
  end
end
