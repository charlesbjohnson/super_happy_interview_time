# frozen_string_literal: true

module LeetCode
  # 367. Valid Perfect Square
  module LC367
    # Description:
    # Given a positive integer num, write a function which returns True if num is a perfect square else False.
    # Follow up: Do not use any built-in library function such as sqrt.
    #
    # Examples:
    # Input: num = 16
    # Output: true
    #
    # Input: num = 14
    # Output: false
    #
    # @param {Integer} num
    # @return {Boolean}
    def is_perfect_square(num)
      lo = 1
      hi = num / 2

      while lo < hi
        mid = ((hi - lo) / 2) + lo
        sqr = mid * mid

        if sqr == num
          return true
        end

        if sqr > num
          hi = mid - 1
        else
          lo = mid + 1
        end
      end

      (lo * lo) == num
    end
  end
end
