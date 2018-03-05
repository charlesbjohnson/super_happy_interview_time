# frozen_string_literal: true

module LeetCode
  # 69. Sqrt(x)
  module LC69
    # Description:
    # Implement sqrt(x).
    # Compute and return the square root of x.
    #
    # Examples:
    # - 1:
    #   Input: 4
    #   Output: 2
    #
    # - 2:
    #   Input: 8
    #   Output: 2
    #
    # Notes:
    # - x is guaranteed to be a non-negative integer.
    #
    # # @param x {Integer}
    # # @return {Integer}
    def my_sqrt(x)
      return x if (0..1).cover?(x)

      low = 1
      high = x

      while low <= high
        mid = low + ((high - low) / 2)
        result = x / mid

        return mid if result == mid

        if mid > result
          high = mid - 1
        else
          low = mid + 1
        end
      end

      low - 1
    end
  end
end
