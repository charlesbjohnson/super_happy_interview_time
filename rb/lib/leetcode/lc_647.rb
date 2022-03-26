# frozen_string_literal: true

module LeetCode
  # 647. Palindromic Substrings
  module LC647
    # Description:
    # Given a string s, return the number of palindromic substrings in it.
    #
    # A string is a palindrome when it reads the same backward as forward.
    # A substring is a contiguous sequence of characters within the string.
    #
    # Examples:
    # Input: s = "abc"
    # Output: 3
    #
    # Input: s = "aaa"
    # Output: 6
    #
    # @param {String} s
    # @return {Integer}
    def count_substrings(s)
      result = 0

      (0...s.length).each { |i|
        l, r = i, i
        while l >= 0 && r < s.length && s[l] == s[r]
          result += 1
          l -= 1
          r += 1
        end

        l, r = i, i + 1
        while l >= 0 && r < s.length && s[l] == s[r]
          result += 1
          l -= 1
          r += 1
        end
      }

      result
    end
  end
end
