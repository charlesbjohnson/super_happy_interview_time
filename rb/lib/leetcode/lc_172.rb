# frozen_string_literal: true

module LeetCode
  # 172. Factorial Trailing Zeroes
  module LC172
    # Description:
    # Given an integer n, return the number of trailing zeroes in n!.
    #
    # Notes:
    # - Your solution should be in logarithmic time complexity.
    #
    # @param n {Integer}
    # @return {Integer}
    def trailing_zeroes(n)
      trailing = 0

      until n.zero?
        n /= 5
        trailing += n
      end

      trailing
    end
  end
end
