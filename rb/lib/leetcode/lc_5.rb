# frozen_string_literal: true

module LeetCode
  # 5. Longest Palindromic Substring
  module LC5
    # Description:
    # Given a string s, return the longest palindromic substring in s.
    #
    # Examples:
    # Input: s = "babad"
    # Output: "bab"
    #
    # Input: s = "cbbd"
    # Output: "bb"
    #
    # @param {String} s
    # @return {String}
    def longest_palindrome(s)
      result = private_methods.grep(/^longest_palindrome_\d+$/).map { |m| send(m, s) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def longest_palindrome_1(s)
      result = 0..0
      cache = Array.new(s.length) { |i| Array.new(s.length) { |j| i == j } }

      (2..s.length).each { |size|
        (0..(s.length - size)).each { |i|
          j = i + size - 1

          next if s[i] != s[j]

          if size == 2 || cache[i + 1][j - 1]
            cache[i][j] = true
            result = [result, i..j].max_by(&:size)
          end
        }
      }

      s[result]
    end

    def longest_palindrome_2(s)
      result = 0..0

      (0...s.length).each { |i|
        l, r = i, i
        while l >= 0 && r < s.length && s[l] == s[r]
          l -= 1
          r += 1
        end

        result = (l + 1)..(r - 1) if r - l - 1 > result.size

        l, r = i, i + 1
        while l >= 0 && r < s.length && s[l] == s[r]
          l -= 1
          r += 1
        end

        result = (l + 1)..(r - 1) if r - l - 1 > result.size
      }

      s[result]
    end
  end
end
