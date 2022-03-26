# frozen_string_literal: true

module LeetCode
  # 16. 3Sum Closest
  module LC16
    # Description:
    # Given an integer array nums of length n and an integer target, find three integers in nums such that the sum is closest to target.
    # Return the sum of the three integers.
    #
    # You may assume that each input would have exactly one solution.
    #
    # Examples:
    # Input: nums = [-1, 2, 1, -4], target = 1
    # Output: 2
    #
    # Input: nums = [0, 0, 0], target = 1
    # Output: 0
    #
    # @param {Array<Integer>} nums
    # @param {Integer} target
    # @return {Integer}
    def three_sum_closest(nums, target)
      nums.sort!

      result = Float::INFINITY

      (0...(nums.length - 2)).each { |i|
        l = i + 1
        r = nums.length - 1

        while l < r
          sum = nums[i] + nums[l] + nums[r]
          result = sum if (sum - target).abs < (result - target).abs

          case sum <=> target
          when 0
            return sum
          when -1
            l += 1
          when 1
            r -= 1
          end
        end
      }

      result
    end
  end
end
