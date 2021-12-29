# frozen_string_literal: true

module LeetCode
  # 485. Max Consecutive Ones
  module LC485
    # Description:
    # Given a binary array nums, return the maximum number of consecutive 1's in the array.
    #
    # Examples:
    # Input: nums = [1, 1, 0, 1, 1, 1]
    # Output: 3
    #
    # Input: nums = [1, 0, 1, 1, 0, 1]
    # Output: 2
    #
    # @param {Array<Integer>} nums
    # @return {Integer}
    def find_max_consecutive_ones(nums)
      max = 0
      counter = 0

      nums.each { |num|
        if num == 1
          counter += 1
        else
          max = [max, counter].max
          counter = 0
        end
      }

      [max, counter].max
    end
  end
end
