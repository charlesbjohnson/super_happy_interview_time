# frozen_string_literal: true

module LeetCode
  # 209. Minimum Size Subarray Sum
  module LC209
    # Description:
    # Given an array of positive integers nums and a positive integer target,
    # return the minimal length of a contiguous subarray [numsl, numsl+1, ..., numsr-1, numsr] of which the sum is greater than or equal to target.
    #
    # If there is no such subarray, return 0 instead.
    #
    # Examples:
    # Input: target = 7, nums = [2, 3, 1, 2, 4, 3]
    # Output: 2
    #
    # Input: target = 4, nums = [1, 4, 4]
    # Output: 1
    #
    # Input: target = 11, nums = [1, 1, 1, 1, 1, 1, 1, 1]
    # Output: 0
    #
    # @param {Integer} target
    # @param {Array<Integer>} nums
    # @return {Integer}
    def min_sub_array_len(target, nums)
      i = 0
      j = 0

      sum = 0
      min = nil

      while j < nums.length
        sum += nums[j]
        j += 1

        while sum >= target
          min = [min, j - i].compact.min
          sum -= nums[i]
          i += 1
        end
      end

      min || 0
    end
  end
end
