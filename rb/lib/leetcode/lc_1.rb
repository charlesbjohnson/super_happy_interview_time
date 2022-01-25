# frozen_string_literal: true

module LeetCode
  # 1. Two Sum
  module LC1
    # Description:
    # Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
    # You may assume that each input would have exactly one solution, and you may not use the same element twice.
    # You can return the answer in any order.
    #
    # Input: nums = [2, 7, 11, 15], target = 9
    # Output: [0, 1]
    #
    # Input: nums = [3, 2, 4], target = 6
    # Output: [1, 2]
    #
    # Input: nums = [3, 3], target = 6
    # Output: [0, 1]
    #
    # @param {Array<Integer>} nums
    # @param {Integer} target
    # @return {Array<Integer>}
    def two_sum(nums, target)
      hash = {}

      nums.each_with_index { |num, i|
        if hash.key?(target - num)
          return [hash[target - num], i]
        end

        hash[num] = i
      }

      [-1, -1]
    end
  end
end
