# typed: true
# frozen_string_literal: true

module LeetCode
  # 191. Number of 1 Bits
  module LC191
    # Description:
    # Write a function that takes an unsigned integer and returns the number of '1' bits it has (also known as the Hamming weight).
    #
    # Examples:
    # Input: 11
    # Output: 3
    # Explanation:
    # 11   (1 0 1 1)
    #       ^   ^ ^
    #
    # @param i {Integer}
    # @return {Integer}
    def hamming_weight(i)
      count = 0

      while i.positive?
        count += i & 1
        i >>= 1
      end

      count
    end
  end
end
