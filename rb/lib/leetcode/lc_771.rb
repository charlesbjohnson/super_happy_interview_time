# frozen_string_literal: true

module LeetCode
  # 771. Jewels and Stones
  module LC771
    # Description:
    # You're given strings J representing the types of stones that are jewels, and S representing the stones you have.
    # Each character in S is a type of stone you have.
    # You want to know how many of the stones you have are also jewels.
    #
    # The letters in J are guaranteed distinct, and all characters in J and S are letters.
    # Letters are case sensitive, so "a" is considered a different type of stone from "A".
    #
    # Examples:
    # - 1:
    #   Input: J = "aA", S = "aAAbbbb"
    #   Output: 3
    #
    # - 2:
    #   Input: J = "z", S = "ZZ"
    #   Output: 0
    #
    # Notes:
    # - S and J will consist of letters and have length at most 50.
    # - The characters in J are distinct.
    #
    # @param jewels {String}
    # @param stones {String}
    # @return {Integer}
    def num_jewels_in_stones(jewels, stones)
      to_code = proc { |c| c.ord - "A".ord }

      jewels = jewels.chars.map(&to_code)
      stones = stones.chars.map(&to_code)

      counts = stones.each.with_object(jewels.each.with_object([]) { |j, count| count[j] = 0 }) { |s, count|
        count[s] += 1 if count[s]
      }

      counts.reject(&:nil?).sum
    end
  end
end
