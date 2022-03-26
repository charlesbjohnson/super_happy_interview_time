# frozen_string_literal: true

module LeetCode
  # 162. Find Peak Element
  module LC162
    # Description:
    # A peak element is an element that is strictly greater than its neighbors.
    # Given an integer array nums, find a peak element, and return its index.
    # If the array contains multiple peaks, return the index to any of the peaks.
    #
    # You may imagine that nums[-1] = nums[n] = -∞.
    #
    # You must write an algorithm that runs in O(log n) time.
    #
    # Examples:
    # Input: nums = [1, 2, 3, 1]
    # Output: 2
    #
    # Input: nums = [1, 2, 1, 3, 5, 6, 4]
    # Output: 5
    #
    # @param {Array<Integer>} nums
    # @return {Integer}
    def find_peak_element(nums)
      lo = 0
      hi = nums.length - 1

      while lo <= hi
        mid = ((hi - lo) / 2) + lo

        l = mid - 1 >= 0 ? nums[mid - 1] : -Float::INFINITY
        r = mid + 1 < nums.length ? nums[mid + 1] : -Float::INFINITY

        return mid if nums[mid] > l && nums[mid] > r

        if nums[mid] < l
          hi = mid - 1
        elsif nums[mid] < r
          lo = mid + 1
        end
      end

      raise
    end
  end
end
