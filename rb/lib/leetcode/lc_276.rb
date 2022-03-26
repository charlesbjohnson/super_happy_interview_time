# frozen_string_literal: true

module LeetCode
  # 276. Paint Fence
  module LC276
    # Description:
    # You are painting a fence of n posts with k different colors. You must paint the posts following these rules:
    # - Every post must be painted exactly one color.
    # - There cannot be three or more consecutive posts with the same color.
    #
    # Given the two integers n and k, return the number of ways you can paint the fence.
    #
    # Examples:
    # Input: n = 3, k = 2
    # Output: 6
    #
    # Input: n = 1, k = 1
    # Output: 1
    #
    # Input: n = 7, k = 2
    # Output: 42
    #
    # @param {Integer} n
    # @param {Integer} k
    # @return {Integer}
    def num_ways(n, k)
      result = private_methods.grep(/^num_ways_\d+$/).map { |m| send(m, n, k) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def num_ways_1(n, k)
      cache = {}

      rec = ->(i) {
        return k if i == 1
        return k**2 if i == 2

        cache[i] ||= (k - 1) * (rec.call(i - 1) + rec.call(i - 2))
      }

      rec.call(n)
    end

    def num_ways_2(n, k)
      cache = Array.new(n + 1)

      cache[1] = k
      cache[2] = k**2

      (3..n).each { |i|
        cache[i] = (k - 1) * (cache[i - 1] + cache[i - 2])
      }

      cache[n]
    end
  end
end
