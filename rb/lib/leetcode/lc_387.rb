# frozen_string_literal: true

module LeetCode
  # 387. First Unique Character in a String
  module LC387
    # Description:
    # Given a string s, find the first non-repeating character in it and return its index.
    # If it does not exist, return -1.
    #
    # Examples:
    # Input: s = "leetcode"
    # Output: 0
    #
    # Input: s = "loveleetcode"
    # Output: 2
    #
    # Input: s = "aabb"
    # Output: -1
    #
    # @param {String} s
    # @return {Integer}
    def first_uniq_char(s)
      hash = Hash.new(0)

      s.each_char { |c| hash[c] += 1 }
      s.each_char.with_index { |c, i| return i if hash[c] == 1 }

      -1
    end
  end
end
