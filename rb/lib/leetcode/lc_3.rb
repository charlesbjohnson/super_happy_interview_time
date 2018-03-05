# frozen_string_literal: true

require 'set'

module LeetCode
  # 3. Longest Substring Without Repeating Characters
  module LC3
    # Description:
    # Given a string, find the length of the longest substring without repeating characters.
    #
    # Examples:
    # - 1:
    #   Input: "abcabcbb"
    #   Output: 3
    #
    # - 2:
    #   Input: "bbbbb"
    #   Output: 1
    #
    # - 3:
    #   Input: "pwwkew"
    #   Output: 3
    #
    # Notes:
    # - Note that the answer must be a substring and not a subsequence.
    #
    # @param s {String}
    # @return {Integer}
    def length_of_longest_substring(s)
      return 0 if s.empty?
      return 1 if s.length == 1

      left = 0
      right = 1

      map = { s[left] => left }
      max = map.length

      while left < s.length - 1 && right < s.length
        v = s[right]

        if !map.key?(v)
          map[v] = right
          right += 1
        else
          new_left = map[v] + 1
          (left...new_left).each { |i| map.delete(s[i]) }
          left = new_left
        end

        max = [map.length, max].max
      end

      max
    end
  end
end
