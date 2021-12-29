# frozen_string_literal: true

module LeetCode
  # 1295. Find Numbers with Even Number of Digits
  module LC1295
    # Description:
    # Given an array nums of integers, return how many of them contain an even number of digits.
    #
    # Examples:
    # Input: nums = [12, 345, 2, 6, 7896]
    # Output: 2
    #
    # Input: nums = [555, 901, 482, 1771]
    # Output: 1
    #
    # @param {Array<Integer>} nums
    # @return {Integer}
    def find_numbers(nums)
      nums.count { |num| num.digits.length.even? }
    end
  end
end
