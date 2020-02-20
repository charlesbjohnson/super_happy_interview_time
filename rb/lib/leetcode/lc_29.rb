# typed: true
# frozen_string_literal: true

module LeetCode
  # 29. Divide Two Integers
  module LC29
    MAX = ((2**32) / 2) - 1
    MIN = -(MAX + 1)

    # Description:
    # Divide two integers without using the multiplication, division or modulo operators.
    #
    # Notes:
    # - If it is overflow, return MAX_INT.
    #
    # @param dividend {Integer}
    # @param divisor {Integer}
    # @return {Integer}
    def divide(dividend, divisor)
      is_negative = dividend.negative? ^ divisor.negative?

      dividend = dividend.abs
      divisor = divisor.abs

      result = 0

      while dividend >= divisor
        tmp = divisor
        i = 1

        while dividend >= tmp
          result += i

          dividend -= tmp
          i <<= 1
          tmp <<= 1
        end
      end

      result = 0 - result if is_negative
      [[result, MIN].max, MAX].min
    end
  end
end
