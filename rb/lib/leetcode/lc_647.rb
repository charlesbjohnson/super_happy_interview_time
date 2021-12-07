# frozen_string_literal: true

module LeetCode
  # 647. Palindromic Substrings
  module LC647
    def count_palindromes_around(s, left, right)
      count = 0

      while left >= 0 && right < s.length && s[left] == s[right]
        left -= 1
        right += 1

        count += 1
      end

      count
    end

    # Description:
    # Given a string, your task is to count how many palindromic substrings in this string.
    # The substrings with different start indexes or end indexes are counted as different substrings even they consist of same characters.
    #
    # Examples:
    #   - 1:
    #     Input: "abc"
    #     Output: 3
    #
    #   - 2:
    #     Input: "aaa"
    #     Output: 6
    #
    # Notes:
    # - The input string length won't exceed 1000.
    #
    # @param s {String}
    # @return {Integer}
    def count_substrings(s)
      (0...s.length).reduce(0) { |cnt, i|
        cnt + count_palindromes_around(s, i, i) + count_palindromes_around(s, i, i + 1)
      }
    end
  end
end
