# frozen_string_literal: true

module LeetCode
  # 509. Fibonacci Number
  module LC509
    # Description:
    # The Fibonacci numbers, commonly denoted F(n) form a sequence, called the Fibonacci sequence,
    # such that each number is the sum of the two preceding ones, starting from 0 and 1.
    #
    # That is,
    # - F(0) = 0, F(1) = 1
    # - F(n) = F(n - 1) + F(n - 2), for n > 1.
    #
    # Given n, calculate F(n).
    #
    # Examples:
    # Input: n = 2
    # Output: 1
    #
    # Input: n = 3
    # Output: 2
    #
    # Input: n = 4
    # Output: 3
    #
    # @param {Integer} n
    # @return {Integer}
    def fib(n)
      return 0 if n == 0

      l = 0
      r = 1

      (n - 1).times {
        tmp = l + r
        l = r
        r = tmp
      }

      r
    end
  end
end
