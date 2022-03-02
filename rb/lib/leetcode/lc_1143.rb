# frozen_string_literal: true

module LeetCode
  # 1143. Longest Common Subsequence
  module LC1143
    # Description:
    # Given two strings text1 and text2, return the length of their longest common subsequence.
    # If there is no common subsequence, return 0.
    #
    # A subsequence of a string is a new string generated from the original string with
    # some characters (can be none) deleted without changing the relative order of the remaining characters.
    # - For example, "ace" is a subsequence of "abcde".
    #
    # A common subsequence of two strings is a subsequence that is common to both strings.
    #
    # Examples:
    # Input: text1 = "abcde", text2 = "ace"
    # Output: 3
    #
    # Input: text1 = "abc", text2 = "abc"
    # Output: 3
    #
    # Input: text1 = "abc", text2 = "def"
    # Output: 0
    #
    # @param {String} text1
    # @param {String} text2
    # @return {Integer}
    def longest_common_subsequence(text1, text2)
      result = private_methods.grep(/^longest_common_subsequence_\d+$/).map { |m| send(m, text1, text2) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def longest_common_subsequence_1(text1, text2)
      cache = {}

      rec = ->(i, j) {
        return 0 if i == text1.length || j == text2.length

        cache[[i, j]] ||= if text1[i] == text2[j]
          1 + rec.call(i + 1, j + 1)
        else
          [
            rec.call(i + 1, j),
            rec.call(i, j + 1)
          ].max
        end
      }

      rec.call(0, 0)
    end

    def longest_common_subsequence_2(text1, text2)
      result = Array.new(text1.length + 1) { Array.new(text2.length + 1, 0) }

      (text1.length - 1).downto(0) { |i|
        (text2.length - 1).downto(0) { |j|
          result[i][j] = if text1[i] == text2[j]
            1 + result[i + 1][j + 1]
          else
            [
              result[i + 1][j],
              result[i][j + 1]
            ].max
          end
        }
      }

      result[0][0]
    end
  end
end
