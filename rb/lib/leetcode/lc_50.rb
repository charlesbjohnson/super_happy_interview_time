# frozen_string_literal: true

module LeetCode
  # 50. Pow(x, n)
  module LC50
    # Description:
    # Implement pow(x, n), which calculates x raised to the power n (i.e., xn).
    #
    # Examples:
    # Input: x = 2.00000, n = 10
    # Output: 1024.00000
    #
    # Input: x = 2.10000, n = 3
    # Output: 9.26100
    #
    # Input: x = 2.00000, n = -2
    # Output: 0.25000
    #
    # @param {Float} x
    # @param {Integer} n
    # @return {Float}
    def my_pow(x, n)
      if n < 0
        n = -n
        x = 1.0 / x
      end

      result = 1

      while n > 0
        exponent = 1
        exponentiated = x

        while exponent * 2 <= n
          exponentiated *= exponentiated
          exponent *= 2
        end

        n -= exponent

        if n == 1
          exponentiated *= x
          n -= 1
        end

        result *= exponentiated
      end

      result
    end
  end
end
