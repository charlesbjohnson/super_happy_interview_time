# frozen_string_literal: true

module LeetCode
  # 724. Find Pivot Index
  module LC724
    # Description:
    # Given an array of integers nums, calculate the pivot index of this array.
    #
    # The pivot index is the index where the sum of all the numbers strictly to the left of the index is equal to the sum of all the numbers strictly to the index's right.
    #
    # If the index is on the left edge of the array, then the left sum is 0 because there are no elements to the left.
    # This also applies to the right edge of the array.
    #
    # Return the leftmost pivot index. If no such index exists, return -1.
    #
    # Examples:
    # Input: nums = [1, 7, 3, 6, 5, 6]
    # Output: 3
    #
    # Input: nums = [1, 2, 3]
    # Output: -1
    #
    # Input: nums = [2, 1, -1]
    # Output: 0
    #
    # @param {Array<Integer>} nums
    # @return {Integer}
    def pivot_index(nums)
      i = 0

      sum_left = 0
      sum_right = nums.sum - nums[i]

      while i < nums.length && sum_left != sum_right
        sum_left += nums[i]
        i += 1
        sum_right -= nums[i] if i < nums.length
      end

      i < nums.length ? i : -1
    end
  end
end
