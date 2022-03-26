# frozen_string_literal: true

module LeetCode
  # 153. Find Minimum in Rotated Sorted Array
  module LC153
    # Description:
    # Suppose an array of length n sorted in ascending order is rotated between 1 and n times.
    # For example, the array nums = [0, 1, 2, 4, 5, 6, 7] might become:
    #
    # - [4, 5, 6, 7, 0, 1, 2] if it was rotated 4 times.
    # - [0, 1, 2, 4, 5, 6, 7] if it was rotated 7 times.
    #
    # Notice that rotating an array [a[0], a[1], a[2], ..., a[n-1]] 1 time results in the array [a[n-1], a[0], a[1], a[2], ..., a[n-2]].
    # Given the sorted rotated array nums of unique elements, return the minimum element of this array.
    #
    # You must write an algorithm that runs in O(log n) time.
    #
    # Examples:
    # Input: nums = [3, 4, 5, 1, 2]
    # Output: 1
    #
    # Input: nums = [4, 5, 6, 7, 0, 1, 2]
    # Output: 0
    #
    # Input: nums = [11, 13, 15, 17]
    # Output: 11
    #
    # @param {Array<Integer>} nums
    # @return {Integer}
    def find_min(nums)
      lo = 0
      hi = nums.length - 1

      while lo < hi
        mid = ((hi - lo) / 2) + lo

        if nums[mid] < nums[lo]
          hi = mid
        elsif nums[mid] > nums[hi]
          lo = mid + 1
        else
          hi = mid - 1
        end
      end

      nums[lo]
    end
  end
end
