# typed: true
# frozen_string_literal: true

module LeetCode
  # 50. Pow(x, n)
  module LC50
    # Description:
    # Implement pow(x, n).
    #
    # Examples:
    # - 1:
    #   Input: x = 2.0, n = 10
    #   Output: 1024.0
    #
    # - 2:
    #   Input: x = 2.1, n = 3
    #   Output: 9.261
    #
    # @param x {Float}
    # @param n {Integer}
    # @return {Float}
    def my_pow(x, n)
      return 1 if n.zero?

      if n.negative?
        n = n.abs
        x = 1.0 / x
      end

      if n.even?
        sub = my_pow(x, n / 2)
        return sub * sub
      end

      x * my_pow(x, n - 1)
    end
  end
end
