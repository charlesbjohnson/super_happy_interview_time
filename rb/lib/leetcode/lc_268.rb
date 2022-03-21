# frozen_string_literal: true

module LeetCode
  # 268. Missing Number
  module LC268
    # Description:
    # Given an array nums containing n distinct numbers in the range [0, n],
    # return the only number in the range that is missing from the array.
    #
    # Follow up: Could you implement a solution using only O(1) extra space complexity and O(n) runtime complexity?
    #
    # Examples:
    # Input: nums = [3, 0, 1]
    # Output: 2
    #
    # Input: nums = [0, 1]
    # Output: 2
    #
    # Input: nums = [9, 6, 4, 2, 3, 5, 7, 0, 1]
    # Output: 8
    #
    # @param {Array<Integer>} nums
    # @return {Integer}
    def missing_number(nums)
      result = private_methods.grep(/^missing_number_\d+$/).map { |m| send(m, nums) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def missing_number_1(nums)
      (0..nums.length).sum - nums.sum
    end

    def missing_number_2(nums)
      nums.each_with_index.reduce(nums.length) { |result, (num, i)| result ^ num ^ i }
    end
  end
end
