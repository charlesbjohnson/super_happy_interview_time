# frozen_string_literal: true

module LeetCode
  # 1220. Count Vowels Permutation
  module LC1220
    # Description:
    # Given an integer n, your task is to count how many strings of length n can be formed under the following rules:
    # - Each character is a lower case vowel ('a', 'e', 'i', 'o', 'u')
    # - Each vowel 'a' may only be followed by an 'e'.
    # - Each vowel 'e' may only be followed by an 'a' or an 'i'.
    # - Each vowel 'i' may not be followed by another 'i'.
    # - Each vowel 'o' may only be followed by an 'i' or a 'u'.
    # - Each vowel 'u' may only be followed by an 'a'.
    #
    # Since the answer may be too large, return it modulo 10^9 + 7.
    #
    # Examples:
    # Input: n = 1
    # Output: 5
    #
    # Input: n = 2
    # Output: 10
    #
    # Input: n = 5
    # Output: 68
    #
    # @param {Integer} n
    # @return {Integer}
    def count_vowel_permutation(n)
      result = private_methods.grep(/^count_vowel_permutation_\d+$/).map { |m| send(m, n) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def count_vowel_permutation_1(n)
      cache = {}

      rec = ->(i, c) {
        return 1 if i == n

        cache[[i, c]] ||= [
          # e, i, u -> a
          c == -1 || c == 1 || c == 2 || c == 4 ? rec.call(i + 1, 0) : 0,

          # a, i -> e
          c == -1 || c == 0 || c == 2 ? rec.call(i + 1, 1) : 0,

          # e, o -> i
          c == -1 || c == 1 || c == 3 ? rec.call(i + 1, 2) : 0,

          # i -> o
          c == -1 || c == 2 ? rec.call(i + 1, 3) : 0,

          # i, o -> u
          c == -1 || c == 2 || c == 3 ? rec.call(i + 1, 4) : 0
        ].sum
      }

      rec.call(0, -1) % (10**9 + 7)
    end

    def count_vowel_permutation_2(n)
      cache = Array.new(n) { |i| Array.new(5) { i == n - 1 ? 1 : 0 } }

      (n - 2).downto(0) { |i|
        # a -> 3
        cache[i][0] = cache[i + 1][1]

        # e -> a, i
        cache[i][1] = cache[i + 1][0] + cache[i + 1][2]

        # i -> a, e, o, u
        cache[i][2] = cache[i + 1][0] + cache[i + 1][1] + cache[i + 1][3] + cache[i + 1][4]

        # o -> i, u
        cache[i][3] = cache[i + 1][2] + cache[i + 1][4]

        # u -> a
        cache[i][4] = cache[i + 1][0]
      }

      cache[0].sum % (10**9 + 7)
    end
  end
end
