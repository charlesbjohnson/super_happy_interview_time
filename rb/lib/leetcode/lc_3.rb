# frozen_string_literal: true

require("set")

module LeetCode
  # 3. Longest Substring Without Repeating Characters
  module LC3
    # Description:
    # Given a string s, find the length of the longest substring without repeating characters.
    #
    # Input: s = "abcabcbb"
    # Output: 3
    #
    # Input: s = "bbbbb"
    # Output: 1
    #
    # Input: s = "pwwkew"
    # Output: 3
    #
    # @param {String} s
    # @return {Integer}
    def length_of_longest_substring(s)
      set = Set.new

      i = 0
      j = 0

      max = 0

      while j < s.length
        if !set.include?(s[j])
          set.add(s[j])
          j += 1
          max = [max, j - i].max
        else
          set.delete(s[i])
          i += 1
        end
      end

      max
    end
  end
end
