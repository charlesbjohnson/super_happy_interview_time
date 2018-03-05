# frozen_string_literal: true

module LeetCode
  # 268. Missing Number
  module LC268
    # Description:
    # Given an array containing n distinct numbers taken from 0, 1, 2, ..., n,
    # find the one that is missing from the array.
    #
    # Examples:
    # - 1:
    #   Input: [3, 0, 1]
    #   Output: 2
    #
    # - 2:
    #   Input: [9, 6, 4, 2, 3, 5, 7, 0, 1]
    #   Output: 8
    #
    # Notes:
    # - Your algorithm should run in linear runtime complexity.
    # - Could you implement it using only constant extra space complexity?
    #
    # @param list {Array<Integer>}
    # @return {Integer}
    def missing_number(list)
      ((list.length * (list.length + 1)) / 2) - list.sum
    end
  end
end
