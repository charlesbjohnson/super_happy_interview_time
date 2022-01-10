# frozen_string_literal: true

module LeetCode
  # 747. Largest Number At Least Twice of Others
  module LC747
    # Description:
    # You are given an integer array nums where the largest integer is unique.
    #
    # Determine whether the largest element in the array is at least twice as much as every other number in the array.
    # If it is, return the index of the largest element, or return -1 otherwise.
    #
    # Examples:
    # Input: nums = [3, 6, 1, 0]
    # Output: 1
    #
    # Input: nums = [1, 2, 3, 4]
    # Output: -1
    #
    # Input: nums = [1]
    # Output: 0
    #
    # @param {Array<Integer>} nums
    # @return {Integer}
    def dominant_index(nums)
      max = 0

      (1...nums.length).each { |i|
        max = i if nums[i] > nums[max]
      }

      nums.each_with_index.all? { |num, i| i == max || nums[max] >= (num * 2) } ? max : -1
    end
  end
end
