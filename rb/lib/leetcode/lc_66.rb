# typed: true
# frozen_string_literal: true

module LeetCode
  # 66. Plus One
  module LC66
    # Description:
    # Given a non-negative integer represented as a non-empty array of digits, plus one to the integer.
    # You may assume the integer do not contain any leading zero, except the number 0 itself.
    # The digits are stored such that the most significant digit is at the head of the list.
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
