# frozen_string_literal: true

module LeetCode
  # 9. Palindrome Number
  module LC9
    # Description:
    # Given an integer x, return true if x is palindrome integer.
    #
    # An integer is a palindrome when it reads the same backward as forward.
    # - For example, 121 is a palindrome while 123 is not.
    #
    # Examples:
    # Input: x = 121
    # Output: true
    #
    # Input: x = -121
    # Output: false
    #
    # Input: x = 10
    # Output: false
    #
    # Input: x = -101
    # Output: false
    #
    # @param {Integer} n
    # @return {Boolean}
    def palindrome?(n)
      n.to_s.reverse == n.to_s
    end
  end
end
