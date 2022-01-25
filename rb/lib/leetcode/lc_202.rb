# frozen_string_literal: true

require("set")

module LeetCode
  # 202. Happy Number
  module LC202
    # Description:
    # Write an algorithm to determine if a number n is happy.
    #
    # A happy number is a number defined by the following process:
    #
    # - Starting with any positive integer, replace the number by the sum of the squares of its digits.
    # - Repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1.
    # - Those numbers for which this process ends in 1 are happy.
    # - Return true if n is a happy number, and false if not.
    #
    # Examples:
    # Input: n = 19
    # Output: true
    #
    # Input: n = 2
    # Output: false
    #
    # @param {Integer} n
    # @return {Boolean}
    def is_happy(n)
      set = Set.new
      result = n

      while result != 1 && !set.include?(result)
        set.add(result)
        result = result.digits.map { |d| d**2 }.sum
      end

      result == 1
    end
  end
end
