# frozen_string_literal: true

module LeetCode
  # 461. Hamming Distance
  module LC461
    # Description:
    # The Hamming distance between two integers is the number of positions at which the corresponding bits are different.
    #
    # Given two integers x and y, calculate the Hamming distance.
    #
    # Examples:
    # Input: x = 1, y = 4
    # Output: 2
    # Explanation:
    # 1   (0 0 0 1)
    # 4   (0 1 0 0)
    #        ^   ^
    # The above arrows point to positions where the corresponding bits are different.
    #
    # Notes:
    # - 0 <= x, y < 231
    #
    # @param x {Integer}
    # @param y {Integer}
    # @return {Integer}
    def hamming_distance(x, y)
      count_ones(x ^ y)
    end

    def count_ones(i)
      count = 0

      while i.positive?
        count += i & 1
        i >>= 1
      end

      count
    end
  end
end
