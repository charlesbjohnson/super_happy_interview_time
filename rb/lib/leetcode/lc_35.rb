# frozen_string_literal: true

module LeetCode
  # 35. Search Insert Position
  module LC35
    # Given a sorted array of distinct integers and a target value, return the index if the target is found.
    # If not, return the index where it would be if it were inserted in order.
    #
    # You must write an algorithm with O(log n) runtime complexity.
    #
    # Examples:
    # Input: nums = [1, 3, 5, 6], target = 5
    # Output: 2
    #
    # Input: nums = [1, 3, 5, 6], target = 2
    # Output: 1
    #
    # Input: nums = [1, 3, 5, 6], target = 7
    # Output: 4
    #
    # Input: nums = [1, 3, 5, 6], target = 0
    # Output: 0
    #
    # Input: nums = [1], target = 0
    # Output: 0
    #
    # @param {Array<Integer>} nums
    # @param {Integer} target
    # @return {Integer}
    def search_insert(nums, target)
      return 0 if nums.length == 0

      left = 0
      right = nums.length - 1

      while left < right
        cursor = left + ((right - left) / 2)

        if nums[cursor] == target
          return cursor
        elsif nums[cursor] > target
          right = cursor - 1
        else
          left = cursor + 1
        end
      end

      left = [left, nums.length - 1].min
      nums[left] < target ? left + 1 : left
    end
  end
end
