# typed: false
# frozen_string_literal: true

module LeetCode
  # 5. Longest Palindromic Substring
  module LC5
    def longest_palindrome_length_around(s, left, right)
      while left >= 0 && right < s.length && s[left] == s[right]
        left -= 1
        right += 1
      end

      (right - left) - 1
    end

    # Description:
    # Given a string s, find the longest palindromic substring in s.
    # You may assume that the maximum length of s is 1000.
    #
    # Examples:
    # - 1:
    #   Input: "babad"
    #   Output: "bab"
    #   Note: "aba" is also a valid answer.
    #
    # - 2:
    #   Input: "cbbd"
    #   Output: "bb"
    #
    # @param s {String}
    # @return {String}
    def longest_palindrome(s)
      left_bound = 0
      right_bound = 0

      (0...s.length).each { |i|
        len_on = longest_palindrome_length_around(s, i, i)
        len_between = longest_palindrome_length_around(s, i, i + 1)

        longest = [len_on, len_between].max

        if longest > (right_bound - left_bound)
          left_bound = i - ((longest - 1) / 2)
          right_bound = i + (longest / 2)
        end
      }

      s[left_bound..right_bound]
    end
  end
end
