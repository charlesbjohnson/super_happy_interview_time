# frozen_string_literal: true

module LeetCode
  # 371. Sum of Two Integers
  module LC371
    # Description:
    # Calculate the sum of two integers left and right, but you are not allowed to use the operator + and -.
    #
    # Examples:
    # Input: left = 1, right = 2
    # Output: 3
    #
    # @param left {Integer}
    # @param right {Integer}
    # @return {Integer}
    def sum(left, right)
      return right if left.zero?
      return left if right.zero?

      while right.nonzero?
        carry = left & right
        left ^= right
        right = carry << 1
      end

      left
    end

    alias get_sum sum
  end
end
