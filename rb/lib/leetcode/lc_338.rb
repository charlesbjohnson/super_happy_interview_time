# typed: true
# frozen_string_literal: true

module LeetCode
  # 338. Counting Bits
  module LC338
    # Description:
    # Given a non negative integer number n, for every number i in the range 0 <= i <= n
    # calculate the number of 1's in their binary representation and return them as an array.
    #
    # Examples:
    # Input: 5
    # Output: [0, 1, 1, 2, 1, 2]
    #
    # Notes:
    # - Can it be done in O(n) time complexity?
    # - Space complexity should be O(n).
    #
    # @param n {Integer}
    # @return {Array<Integer>}
    def count_bits(n)
      result = Array.new(n + 1, 0)

      (1...result.length).each do |i|
        result[i] += result[i & (i - 1)] + 1
      end

      result
    end
  end
end
