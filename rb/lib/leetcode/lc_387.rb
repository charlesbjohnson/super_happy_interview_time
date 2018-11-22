# frozen_string_literal: true

module LeetCode
  # 387. First Unique Character in a String
  module LC387
    # Description:
    # Given a string, find the first non-repeating character in it and return its index. If it doesn't exist, return -1.
    #
    # Examples:
    # - 1:
    #   Input: 'leetcode'
    #   Output: 0
    #
    # - 2:
    #   Input: 'loveleetcode'
    #   Output: 2
    #
    # Notes:
    # - You may assume the string contain only lowercase letters.
    #
    # @param s {String}
    # @return {Integer}
    def first_uniq_char(s)
      return -1 if s.empty?
      return 0 if s.length < 2

      if s.length < 3
        return s[0] != s[1] ? 0 : -1
      end

      s = s.chars
           .map.with_index { |c, i| [c, i] }
           .sort_by { |c, _| c }

      uniq = []

      uniq.push(s[0].last) if s[0].first != s[1].first
      uniq.push(s[s.length - 1].last) if s[s.length - 1].first != s[s.length - 2].first

      (1...s.length - 1).each do |i|
        uniq.push(s[i].last) if s[i].first != s[i - 1].first && s[i].first != s[i + 1].first
      end

      return -1 if uniq.empty?

      uniq.min
    end
  end
end
