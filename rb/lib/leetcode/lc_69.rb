# frozen_string_literal: true

module LeetCode
  # 69. Sqrt(x)
  module LC69
    # Description:
    # Given a non-negative integer x, compute and return the square root of x.
    # Since the return type is an integer, the decimal digits are truncated, and only the integer part of the result is returned.
    #
    # Note: You are not allowed to use any built-in exponent function or operator, such as pow(x, 0.5) or x ** 0.5.
    #
    # Examples:
    # Input: x = 4
    # Output: 2
    #
    # Input: x = 8
    # Output: 2
    #
    # @param {Integer} x
    # @return {Integer}
    def my_sqrt(x)
      lo = 0
      hi = x

      while lo <= hi
        sqrt = ((hi - lo) / 2) + lo
        sqrd = sqrt * sqrt

        if sqrd == x || (sqrd < x && ((sqrt + 1) * (sqrt + 1)) > x)
          return sqrt
        end

        if sqrd > x
          hi = sqrt - 1
        else
          lo = sqrt + 1
        end
      end

      raise
    end
  end
end
