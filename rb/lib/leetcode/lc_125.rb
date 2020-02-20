# typed: true
# frozen_string_literal: true

module LeetCode
  # 125. Valid Palindrome
  module LC125
    # Description:
    # Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
    # Examples:
    # - 1:
    #   Input: "A man, a plan, a canal: Panama"
    #   Output: true
    #
    # - 2:
    #   Input: "racecar a car"
    #   Output: false
    #
    # Notes:
    # - Have you consider that the string might be empty? This is a good question to ask during an interview.
    # - For the purpose of this problem, we define empty string as valid palindrome.
    #
    # @param s {String}
    # @return {Boolean}
    def palindrome?(s)
      return true if s.length < 2

      s = s.downcase.gsub(/[^0-9a-z]/, '')
      s == s.reverse
    end

    alias is_palindrome palindrome?
  end
end
