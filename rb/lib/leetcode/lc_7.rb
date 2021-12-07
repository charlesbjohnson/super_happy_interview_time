# frozen_string_literal: true

module LeetCode
  # 7. Reverse Integer
  module LC7
    MAX = (2**32 / 2) - 1
    MIN = -(MAX + 1)

    # Description:
    # Given a 32-bit signed integer, reverse digits of an integer.
    #
    # Examples:
    # - 1:
    #   Input: 123
    #   Output: 321
    #
    # - 2:
    #   Input: -123
    #   Output: -321
    #
    # - 3:
    #   Input: 120
    #   Output: 21
    #
    # Notes:
    # - Assume we are dealing with an environment which could only hold integers within the 32-bit signed integer range.
    # - For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.
    #
    # @param x {Integer}
    # @return {Integer}
    def reverse(x)
      reversed = x.to_s.reverse.tap { |s| s.chop!.prepend("-") if s[-1] == "-" }.to_i
      reversed = 0 if reversed > MAX || reversed < MIN
      reversed
    end
  end
end
