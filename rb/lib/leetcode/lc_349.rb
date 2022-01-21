# frozen_string_literal: true

module LeetCode
  # 349. Intersection of Two Arrays
  module LC349
    # Description:
    # Given two integer arrays nums1 and nums2, return an array of their intersection.
    # Each element in the result must be unique and you may return the result in any order.
    #
    # Examples:
    # Input: nums1 = [1, 2, 2, 1], nums2 = [2, 2]
    # Output: [2]
    #
    # Input: nums1 = [4, 9, 5], nums2 = [9, 4, 9, 8, 4]
    # Output: [9, 4]
    #
    # @param {Array<Integer>} nums1
    # @param {Array<Integer>} nums2
    # @param {Array<Integer>}
    def intersection(nums1, nums2)
      nums1 & nums2
    end
  end
end
