# frozen_string_literal: true

module LeetCode
  # 136. Single Number
  module LC136
    # Description:
    # Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.
    #
    # You must implement a solution with a linear runtime complexity and use only constant extra space.
    #
    # @param {Array<Integer>} nums
    # @return {Integer}
    def single_number(nums)
      (nums.to_set.sum * 2) - nums.sum
    end
  end
end
