# typed: true
# frozen_string_literal: true

module LeetCode
  # 438. Find All Anagrams in a String
  module LC438
    def to_code(char)
      char.ord - "a".ord
    end

    def count_chars(str)
      str.chars.each.with_object(Array.new(26, 0)) { |c, counts| counts[to_code(c)] += 1 }
    end

    # Description:
    # Given a string str and a non-empty string substr,
    # find all the start indices of substr's anagrams in str.
    #
    # Examples:
    # - 1:
    #   Input: str = "cbaebabacd", substr = "abc"
    #   Output: [0, 6]
    #   Explanation:
    #   The substring with start index = 0 is "cba", which is an anagram of "abc".
    #   The substring with start index = 6 is "bac", which is an anagram of "abc".
    #
    # - 2:
    #   Input: str = "abab", substr = "ab"
    #   Output: [0, 1, 2]
    #   Explanation:
    #   The substring with start index = 0 is "ab", which is an anagram of "ab".
    #   The substring with start index = 1 is "ba", which is an anagram of "ab".
    #   The substring with start index = 2 is "ab", which is an anagram of "ab".
    #
    # Notes:
    # - Strings consists of lowercase English letters only.
    # - The length of both strings str and substr will not be larger than 20,100.
    # - The order of output does not matter.
    #
    # @param str {String}
    # @param substr {String}
    # @return {Array<Integer>}
    def find_anagrams(str, substr)
      return Array.new(str.length + 1) { |i| i } if substr.empty?
      return [] if substr.length > str.length

      result = []

      left = 0
      right = substr.length - 1

      substr_chars = count_chars(substr)
      slice_chars = count_chars(str[left...right])

      while left <= (str.length - substr.length) && right < str.length
        slice_chars[to_code(str[right])] += 1
        result.push(left) if slice_chars == substr_chars
        slice_chars[to_code(str[left])] -= 1

        left += 1
        right += 1
      end

      result
    end
  end
end
