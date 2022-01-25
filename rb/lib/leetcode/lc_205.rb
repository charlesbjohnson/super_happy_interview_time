# frozen_string_literal: true

module LeetCode
  # 205. Isomorphic Strings
  module LC205
    # Description:
    # Given two strings s and t, determine if they are isomorphic.
    # Two strings s and t are isomorphic if the characters in s can be replaced to get t.
    #
    # All occurrences of a character must be replaced with another character while preserving the order of characters.
    # No two characters may map to the same character, but a character may map to itself.
    #
    # Examples:
    # Input: s = "egg", t = "add"
    # Output: true
    #
    # Input: s = "foo", t = "bar"
    # Output: false
    #
    # Input: s = "paper", t = "title"
    # Output: true
    #
    # @param {String} s
    # @param {String} t
    # @return {Boolean}
    def is_isomorphic(s, t)
      s_hash = {}
      t_hash = {}

      i = 0

      while i < s.length
        if s_hash.key?(s[i])
          return false if s_hash[s[i]] != t[i]
        else
          s_hash[s[i]] = t[i]
        end

        if t_hash.key?(t[i])
          return false if t_hash[t[i]] != s[i]
        else
          t_hash[t[i]] = s[i]
        end

        i += 1
      end

      true
    end
  end
end
