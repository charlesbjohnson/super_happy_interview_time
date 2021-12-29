# frozen_string_literal: true

module LeetCode
  # 414. Third Maximum Number
  module LC414
    # Description:
    # Given an integer array nums, return the third distinct maximum number in this array. If the third maximum does not exist, return the maximum number.
    #
    # Examples:
    # Input: nums = [3, 2, 1]
    # Output: 1
    #
    # Input: nums = [1, 2]
    # Output: 2
    #
    # Input: nums = [2, 2, 3, 1]
    # Output: 1
    #
    # @param {Array<Integer>} nums
    # @return {Integer}
    def third_max(nums)
      maxes = []

      [nums.length, 3].min.times {
        max = nums.reduce(nil) { |max, num|
          next max if !maxes.empty? && num >= maxes.last
          next num if !max
          [num, max].max
        }

        maxes.push(max) if max
      }

      maxes.length == 3 ? maxes.last : maxes.first
    end
  end
end
