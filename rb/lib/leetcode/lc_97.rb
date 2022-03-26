# frozen_string_literal: true

module LeetCode
  # 97. Interleaving String
  module LC97
    # Description:
    # Given strings s1, s2, and s3, find whether s3 is formed by an interleaving of s1 and s2.
    #
    # An interleaving of two strings s and t is a configuration where they are divided into non-empty substrings such that:
    #
    # - s = s1 + s2 + ... + sn
    # - t = t1 + t2 + ... + tm
    # - |n - m| <= 1
    # - The interleaving is s1 + t1 + s2 + t2 + s3 + t3 + ... or t1 + s1 + t2 + s2 + t3 + s3 + ...
    #
    # Note: a + b is the concatenation of strings a and b.
    #
    # Examples:
    # Input: s1 = "aabcc", s2 = "dbbca", s3 = "aadbbcbcac"
    # Output: true
    #
    # Input: s1 = "aabcc", s2 = "dbbca", s3 = "aadbbbaccc"
    # Output: false
    #
    # Input: s1 = "", s2 = "", s3 = ""
    # Output: true
    #
    # @param {String} s1
    # @param {String} s2
    # @param {String} s3
    # @return {Boolean}
    def is_interleave(s1, s2, s3)
      result = private_methods.grep(/^is_interleave_\d+$/).map { |m| send(m, s1, s2, s3) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def is_interleave_1(s1, s2, s3)
      return false if s3.length != (s1.length + s2.length)

      cache = {}

      rec = ->(i, l) {
        r = i - l

        return true if l == s1.length && r == s2.length && i == s3.length

        return s3[i..] == s2[r..] if l == s1.length
        return s3[i..] == s1[l..] if r == s2.length

        cache[[l, i]] ||= \
          s3[i] == s1[l] && rec.call(i + 1, l + 1) ||
          s3[i] == s2[r] && rec.call(i + 1, l)
      }

      rec.call(0, 0)
    end

    def is_interleave_2(s1, s2, s3)
      return false if s3.length != (s1.length + s2.length)

      cache = Array.new(s3.length + 1) { |i| Array.new(s1.length + 1) { |l| i == s3.length && l == s1.length } }

      (s3.length - 1).downto(0) { |i|
        ([s1.length, i].min).downto([i - s2.length, 0].max) { |l|
          r = i - l

          cache[i][l] = \
            l < s1.length && s3[i] == s1[l] && cache[i + 1][l + 1] ||
            r < s2.length && s3[i] == s2[r] && cache[i + 1][l]
        }
      }

      cache[0][0]
    end
  end
end
