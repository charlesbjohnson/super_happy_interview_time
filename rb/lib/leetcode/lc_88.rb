# frozen_string_literal: true

module LeetCode
  # 88. Merge Sorted Array
  module LC88
    # Description:
    # You are given two integer arrays nums1 and nums2, sorted in non-decreasing order,
    # and two integers m and n, representing the number of elements in nums1 and nums2 respectively.
    #
    # Merge nums1 and nums2 into a single array sorted in non-decreasing order.
    #
    # The final sorted array should not be returned by the function,
    # but instead be stored inside the array nums1.
    #
    # To accommodate this, nums1 has a length of m + n, where the first m elements denote the elements that should be merged,
    # and the last n elements are set to 0 and should be ignored. nums2 has a length of n.
    #
    # Examples:
    # Input: nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
    # Output: [1,2,2,3,5,6]
    #
    # Input: nums1 = [1], m = 1, nums2 = [], n = 0
    # Output: [1]
    #
    # Input: nums1 = [0], m = 0, nums2 = [1], n = 1
    # Output: [1]
    #
    # @param {Array<Integer>} nums1
    # @param {Integer} m
    # @param {Array<Integer>} nums2
    # @param {Integer} n
    # @return {nil}
    def merge(nums1, m, nums2, n)
      i = m - 1
      j = n - 1

      k = nums1.length - 1

      while k >= 0
        if (i >= 0 && j >= 0 && nums1[i] > nums2[j]) || j < 0
          nums1[k] = nums1[i]
          i -= 1
        elsif (i >= 0 && j >= 0 && nums1[i] <= nums2[j]) || i < 0
          nums1[k] = nums2[j]
          j -= 1
        end

        k -= 1
      end

      nums1
    end
  end
end
