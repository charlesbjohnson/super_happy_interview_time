# frozen_string_literal: true

module LeetCode
  # 338. Counting Bits
  module LC338
    # Description:
    # Given an integer n, return an array ans of length n + 1 such that for each i (0 <= i <= n),
    # ans[i] is the number of 1's in the binary representation of i.
    #
    # Follow up:
    # - It is very easy to come up with a solution with a runtime of O(n log n).
    #   Can you do it in linear time O(n) and possibly in a single pass?
    # - Can you do it without using any built-in function (i.e., like __builtin_popcount in C++)?
    #
    # Examples:
    # Input: n = 2
    # Output: [0, 1, 1]
    #
    # Input: n = 5
    # Output: [0, 1, 1, 2, 1, 2]
    #
    # @param {Integer} n
    # @return {Array<Integer>}
    def count_bits(n)
      result = private_methods.grep(/^count_bits_\d+$/).map { |m| send(m, n) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def count_bits_1(n)
      (0..n).map { |i|
        v = 0

        while i > 0
          v += (i & 1)
          i >>= 1
        end

        v
      }
    end

    def count_bits_2(n)
      result = Array.new(n + 1, 0)

      (1..n).each { |i|
        result[i] = result[i >> 1] + (i & 1)
      }

      result
    end
  end
end
