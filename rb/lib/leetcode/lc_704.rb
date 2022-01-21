# frozen_string_literal: true

module LeetCode
  # 704. Binary Search
  module LC704
    # Description:
    # Given an array of integers nums which is sorted in ascending order, and an integer target, write a function to search target in nums.
    # If target exists, then return its index. Otherwise, return -1.
    #
    # You must write an algorithm with O(log n) runtime complexity.
    #
    # Examples:
    # Input: nums = [-1, 0, 3, 5, 9, 12], target = 9
    # Output: 4
    #
    # Input: nums = [-1, 0, 3, 5, 9, 12], target = 2
    # Output: -1
    #
    # @param {Array<Integer>} nums
    # @param {Integer} target
    # @return {Integer}
    def search(nums, target)
      lo = 0
      hi = nums.length - 1

      while lo <= hi
        mid = ((hi - lo) / 2) + lo

        if nums[mid] > target
          hi = mid - 1
        elsif nums[mid] < target
          lo = mid + 1
        else
          return mid
        end
      end

      -1
    end
  end
end
