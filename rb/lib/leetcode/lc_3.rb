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
      result = private_methods.grep(/^length_of_longest_substring_\d+$/).map { |m| send(m, s) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def length_of_longest_substring_1(s)
      result = 0

      i = 0
      j = 0

      letters = Set.new

      while j < s.length
        if letters.include?(s[j])
          letters.delete(s[i])
          i += 1
        else
          letters.add(s[j])
          j += 1
        end

        result = [result, j - i].max
      end

      result
    end

    def length_of_longest_substring_2(s)
      result = 0

      i = 0
      j = 0

      letters = Hash.new(0)

      while j < s.length
        letters[s[j]] += 1
        j += 1

        while letters[s[j - 1]] > 1
          letters[s[i]] -= 1
          i += 1
        end

        result = [result, j - i].max
      end

      result
    end
  end
end
