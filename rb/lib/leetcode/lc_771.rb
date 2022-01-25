# frozen_string_literal: true

module LeetCode
  # 771. Jewels and Stones
  module LC771
    # Description:
    # You're given strings jewels representing the types of stones that are jewels, and stones representing the stones you have.
    # Each character in stones is a type of stone you have. You want to know how many of the stones you have are also jewels.
    #
    # Letters are case sensitive, so "a" is considered a different type of stone from "A".
    #
    # Examples:
    # Input: jewels = "aA", stones = "aAAbbbb"
    # Output: 3
    #
    # Input: jewels = "z", stones = "ZZ"
    # Output: 0
    #
    # @param {String} jewels
    # @param {String} stones
    # @return {Integer}
    def num_jewels_in_stones(jewels, stones)
      jewels = jewels.chars.to_set
      stones.each_char.reduce(0) { |count, stone|
        jewels.include?(stone) ? count + 1 : count
      }
    end
  end
end
