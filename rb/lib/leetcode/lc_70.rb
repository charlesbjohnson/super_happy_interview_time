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
      result = private_methods.grep(/^climb_stairs_\d+$/).map { |m| send(m, n) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def climb_stairs_1(n)
      cache = {}

      rec = ->(i) {
        return 1 if i == n - 1
        return 2 if i == n - 2

        cache[i] ||= rec.call(i + 1) + rec.call(i + 2)
      }

      rec.call(0)
    end

    def climb_stairs_2(n)
      result = Array.new(n)

      result[-1] = 1
      result[-2] = 2 if n > 1

      (n - 3).downto(0) { |i|
        result[i] = result[i + 1] + result[i + 2]
      }

      result[0]
    end
  end
end
