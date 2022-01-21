# frozen_string_literal: true

module LeetCode
  # 719. Find K-th Smallest Pair Distance
  module LC719
    # Description:
    # The distance of a pair of integers a and b is defined as the absolute difference between a and b.
    #
    # Given an integer array nums and an integer k,
    # return the kth smallest distance among all the pairs nums[i] and nums[j] where 0 <= i < j < nums.length.
    #
    # Examples:
    # Input: nums = [1, 3, 1], k = 1
    # Output: 0
    #
    # Input: nums = [1, 1, 1], k = 2
    # Output: 0
    #
    # Input: nums = [1, 6, 1], k = 3
    # Output: 5
    #
    # @param {Array<Integer>} nums
    # @param {Integer} k
    # @return {Integer}
    def smallest_distance_pair(nums, k)
      nums.sort!

      lo = 0
      hi = nums[nums.length - 1] - nums[0]

      while lo < hi
        mid = ((hi - lo) / 2) + lo
        count = 0

        i = 0
        j = 1

        while i < nums.length
          j += 1 while j < nums.length && nums[j] - nums[i] <= mid
          count += (j - 1) - i
          i += 1
        end

        if count >= k
          hi = mid
        else
          lo = mid + 1
        end
      end

      lo
    end
  end
end
