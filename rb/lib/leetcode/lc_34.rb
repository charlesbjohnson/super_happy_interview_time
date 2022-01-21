# frozen_string_literal: true

module LeetCode
  # 34. Find First and Last Position of Element in Sorted Array
  module LC34
    # Description:
    # Given an array of integers nums sorted in non-decreasing order, find the starting and ending position of a given target value.
    # If target is not found in the array, return [-1, -1].
    #
    # You must write an algorithm with O(log n) runtime complexity.
    #
    # Examples:
    # Input: nums = [5, 7, 7, 8, 8, 10], target = 8
    # Output: [3, 4]
    #
    # Input: nums = [5, 7, 7, 8, 8, 10], target = 6
    # Output: [-1, -1]
    #
    # Input: nums = [], target = 0
    # Output: [-1,-1]
    #
    # @param {Array<Integer>} nums
    # @param {Integer} target
    # @return {Array(Integer, Integer)}
    def search_range(nums, target)
      range = [-1, -1]

      lo = 0
      hi = nums.length - 1

      while lo < hi
        mid = ((hi - lo) / 2) + lo

        if nums[mid] < target
          lo = mid + 1
        else
          hi = mid
        end
      end

      return range if nums[lo] != target

      range[0] = lo
      hi = nums.length - 1

      while lo < hi
        mid = ((hi - lo) / 2) + lo + 1

        if nums[mid] > target
          hi = mid - 1
        else
          lo = mid
        end
      end

      range[1] = lo
      range
    end
  end
end
