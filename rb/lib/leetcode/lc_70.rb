# frozen_string_literal: true

module LeetCode
  # 70. Climbing Stairs
  module LC70
    def climb_stairs_recurse(step, steps, cache)
      return 0 if step > steps
      return 1 if step == steps
      return cache[step] if cache[step]

      cache[step] = climb_stairs_recurse(step + 1, steps, cache) + climb_stairs_recurse(step + 2, steps, cache)
      cache[step]
    end

    # Description:
    # You are climbing a stair case. It takes n steps to reach to the top.
    #
    # Each time you can either climb 1 or 2 steps.
    # In how many distinct ways can you climb to the top?
    #
    # Examples:
    # - 1:
    #   Input: 2
    #   Output: 2
    #   Explanation:  There are two ways to climb to the top.
    #     1. 1 step + 1 step
    #     2. 2 steps
    #
    # - 2:
    #   Input: 3
    #   Output: 3
    #   Explanation:  There are three ways to climb to the top.
    #     1. 1 step + 1 step + 1 step
    #     2. 1 step + 2 steps
    #     3. 2 steps + 1 step
    #
    # Notes:
    # - Given n will be a positive integer.
    #
    # @param n {Integer}
    # @return {Integer}
    def climb_stairs(n)
      climb_stairs_recurse(0, n, [])
    end
  end
end
