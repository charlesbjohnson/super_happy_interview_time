# frozen_string_literal: true

module LeetCode
  # 448. Find All Numbers Disappeared in an Array
  module LC448
    # Description:
    # Given an array nums of n integers where nums[i] is in the range [1, n],
    # return an array of all the integers in the range [1, n] that do not appear in nums.
    #
    # Follow up: Could you do it without extra space and in O(n) runtime?
    # You may assume the returned list does not count as extra space.
    #
    # Examples:
    # Input: [4, 3, 2, 7, 8, 2, 3, 1]
    # Output: [5, 6]
    #
    # Input: nums = [1, 1]
    # Output: [2]
    #
    # @param {Array<Integer>} nums
    # @return {Array<Integer>}
    def find_disappeared_numbers(nums)
      result = private_methods.grep(/^find_disappeared_numbers_\d+$/).map { |m| send(m, nums.clone) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def find_disappeared_numbers_1(nums)
      nums.reduce(Set.new(1..nums.length)) { |set, num| set.delete(num) }.to_a
    end

    def find_disappeared_numbers_2(nums)
      result = []

      nums.each { |num|
        nums[num.abs - 1] = -nums[num.abs - 1].abs
      }

      nums.each_with_index { |num, i|
        result.push(i + 1) if num > 0
      }

      result
    end
  end
end
