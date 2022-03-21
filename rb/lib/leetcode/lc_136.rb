# frozen_string_literal: true

module LeetCode
  # 136. Single Number
  module LC136
    # Description:
    # Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.
    #
    # You must implement a solution with a linear runtime complexity and use only constant extra space.
    #
    # Input: nums = [2, 2, 1]
    # Output: 1
    #
    # Input: nums = [4, 1, 2, 1, 2]
    # Output: 4
    #
    # Input: nums = [1]
    # Output: 1
    #
    # @param {Array<Integer>} nums
    # @return {Integer}
    def single_number(nums)
      result = private_methods.grep(/^single_number_\d+$/).map { |m| send(m, nums) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def single_number_1(nums)
      (nums.to_set.sum * 2) - nums.sum
    end

    def single_number_2(nums)
      nums.reduce(0) { |result, num| result ^ num }
    end
  end
end
