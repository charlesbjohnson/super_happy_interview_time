# frozen_string_literal: true

require 'set'

module LeetCode
  # 202. Happy Number
  module LC202
    # Description:
    # Write an algorithm to determine if a number is "happy".
    #
    # A happy number is a number defined by the following process:
    # - Starting with any positive integer
    # - Replace the number by the sum of the squares of its digits
    # - Repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1.
    #
    # Those numbers for which this process ends in 1 are happy numbers.
    #
    # Examples:
    # Input: 19
    # Output: true
    # Explanation:
    #   1^2 + 9^2       = 82
    #   8^2 + 2^2       = 68
    #   6^2 + 8^2       = 100
    #   1^2 + 0^2 + 0^2 = 1
    #
    # @param n {Integer}
    # @return {Boolean}
    def happy?(n)
      set = Set.new([n])

      until n == 1
        n = n.digits.map { |d| d**2 }.sum
        return false unless set.add?(n)
      end

      true
    end

    alias is_happy happy?
  end
end
