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

        l_mid = mid - 1 >= 0 ? nums[mid - 1] : -Float::INFINITY
        r_mid = mid + 1 < nums.length ? nums[mid + 1] : -Float::INFINITY

        if nums[mid] > l_mid && nums[mid] > r_mid
          return mid
        end

        if l_mid > nums[mid]
          hi = mid - 1
        elsif r_mid > nums[mid]
          lo = mid + 1
        end
      end

      peak
    end
  end
end
