# typed: true
# frozen_string_literal: true

module LeetCode
  # 349. Intersection of Two Arrays
  module LC349
    # Description:
    # Given two arrays, write a function to compute their intersection.
    #
    # Examples:
    # Input: left = [1, 2, 2, 1], right = [2, 2]
    # Output: [2]
    #
    # Notes:
    # - Each element in the result must be unique.
    # - The result can be in any order.
    #
    # @param left {Array<Integer>}
    # @param right {Array<Integer>}
    # @param {Array<Integer>}
    def intersection(left, right)
      left & right
    end
  end
end
