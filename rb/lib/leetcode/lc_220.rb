# frozen_string_literal: true

module LeetCode
  # 220. Contains Duplicate III
  module LC220
    # Description:
    # Given an integer array nums and two integers k and t,
    # return true if there are two distinct indices i and j in the array such that abs(nums[i] - nums[j]) <= t and abs(i - j) <= k.
    #
    # Examples:
    # Input: nums = [1, 2, 3, 1], k = 3, t = 0
    # Output: true
    #
    # Input: nums = [1, 0, 1, 1], k = 1, t = 2
    # Output: true
    #
    # Input: nums = [1, 5, 9, 1, 5, 9], k = 2, t = 3
    # Output: false
    #
    # @param {Array<Integer>} nums
    # @param {Integer} k
    # @param {Integer} t
    # @return {Boolean}
    def contains_nearby_almost_duplicate(nums, k, t)
      return false if k == 0

      hash = {}

      nums.each_with_index { |num, i|
        key = num / (t + 1)

        return true if hash.key?(key)
        return true if hash.key?(key - 1) && (num - hash[key - 1]).abs <= t
        return true if hash.key?(key + 1) && (num - hash[key + 1]).abs <= t

        hash[key] = num
        hash.delete(nums[i - k] / (t + 1)) if i >= k
      }

      false
    end
  end
end
