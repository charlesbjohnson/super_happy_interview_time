# typed: true
# frozen_string_literal: true

module LeetCode
  # 190. Reverse Bits
  module LC190
    # Description:
    # Reverse bits of a given 32 bits unsigned integer.
    #
    # Examples:
    # Input: 43261596
    # Output: 964176192
    # Explanation:
    # 43261596   (0000 0010 1001 0100 0001 1110 1001 1100)
    # 964176192  (0011 1001 0111 1000 0010 1001 0100 0000)
    #
    # Notes:
    # - If this function is called many times, how would you optimize it?
    #
    # @param n {Integer}
    # @return {Integer}
    def reverse_bits(n)
      reversed = 0

      32.times.each do
        reversed <<= 1
        reversed |= (n & 1)

        n >>= 1
      end

      reversed
    end
  end
end
