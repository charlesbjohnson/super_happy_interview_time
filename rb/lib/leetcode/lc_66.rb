# frozen_string_literal: true

module LeetCode
  # 66. Plus One
  module LC66
    # Description:
    # You are given a large integer represented as an integer array digits, where each digits[i] is the ith digit of the integer.
    # The digits are ordered from most significant to least significant in left-to-right order.
    # The large integer does not contain any leading 0's.
    #
    # Increment the large integer by one and return the resulting array of digits.
    #
    # Examples:
    # Input: digits = [1, 2, 3]
    # Output: [1, 2, 4]
    #
    # Input: digits = [4, 3, 2, 1]
    # Output: [4, 3, 2, 2]
    #
    # Input: digits = [9]
    # Output: [1, 0]
    #
    # @param digits {Array<Integer>}
    # @return {Array>Integer>}
    def plus_one(digits)
      offset = 1

      offset += 1 while offset <= digits.length && digits[digits.length - offset] == 9

      if offset > digits.length
        digits.unshift(1)
      else
        digits[digits.length - offset] += 1
      end

      offset -= 1
      while offset.positive?
        digits[digits.length - offset] = 0
        offset -= 1
      end

      digits
    end
  end
end
