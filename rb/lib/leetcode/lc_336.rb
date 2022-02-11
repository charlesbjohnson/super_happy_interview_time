# frozen_string_literal: true

module LeetCode
  # 336. Palindrome Pairs
  module LC336
    # Description:
    # Given a list of unique words, return all the pairs of the distinct indices (i, j) in the given list,
    # so that the concatenation of the two words words[i] + words[j] is a palindrome.
    #
    # Examples:
    # Input: words = ["abcd", "dcba", "lls", "s", "sssll"]
    # Output: [[0, 1], [1, 0], [3, 2], [2, 4]]
    #
    # Input: words = ["bat", "tab", "cat"]
    # Output: [[0, 1], [1, 0]]
    #
    # Input: words = ["a", ""]
    # Output: [[0, 1], [1, 0]]
    #
    # @param {Array<String>} words
    # @return {Array<Array<Integer>>}
    def palindrome_pairs(words)
      result = []

      (0...words.length).each { |i|
        (0...words.length).each { |j|
          result.push([i, j]) if i != j && concat_palindrome?(words[i], words[j])
        }
      }

      result
    end

    private

    def concat_palindrome?(left, right)
      return palindrome?(left) if right == ""
      return palindrome?(right) if left == ""

      i = 0
      j = left.length + right.length - 1

      l = left
      r = right

      while i < j
        ii = l == right ? i - left.length : i
        jj = r == right ? j - left.length : j

        return false if l[ii] != r[jj]

        l = right if ii == left.length - 1
        r = left if jj == 0

        i += 1
        j -= 1
      end

      true
    end

    def palindrome?(s)
      (0...(s.length / 2)).each { |i|
        return false if s[i] != s[-(i + 1)]
      }

      true
    end
  end
end
