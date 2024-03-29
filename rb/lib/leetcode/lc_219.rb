# frozen_string_literal: true

module LeetCode
  # 219. Contains Duplicate II
  module LC219
    # Description:
    # Given an integer array nums and an integer k, return true if there are two distinct indices i and j in the array such that nums[i] == nums[j] and abs(i - j) <= k.
    #
    # Examples:
    # Input: nums = [1, 2, 3, 1], k = 3
    # Output: true
    #
    # Input: nums = [1, 0, 1, 1], k = 1
    # Output: true
    #
    # Input: nums = [1, 2, 3, 1, 2, 3], k = 2
    # Output: false
    #
    # @param {Array<Integer>} nums
    # @param {Integer} k
    # @return {Boolean}
    def contains_nearby_duplicate(nums, k)
      set = Set.new

      nums.each_with_index { |num, i|
        return true if !set.add?(num)
        set.delete(nums[i - k]) if set.size > k
      }

      false
    end
  end
end
