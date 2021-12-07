# frozen_string_literal: true

module LeetCode
  # 242. Valid Anagram
  module LC242
    # Description:
    # Given two strings s and t, write a function to determine if t is an anagram of s.
    #
    # Examples:
    # - 1:
    #   Input: substring = "anagram", string = "nagaram"
    #   Output: true
    #
    # - 2:
    #   Input: substring = "rat", string = "car"
    #   Output: false
    #
    # Notes:
    # - You may assume the string contains only lowercase alphabets.
    # - What if the inputs contain unicode characters? How would you adapt your solution to such case?
    #
    # @param substring {String}
    # @param string {String}
    # @return {Boolean}
    def anagram?(substring, string)
      substring.chars.sort == string.chars.sort
    end

    alias_method(:is_anagram, :anagram?)
  end
end
