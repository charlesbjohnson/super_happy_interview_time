# frozen_string_literal: true

module LeetCode
  # 442. Find All Duplicates in an Array
  module LC442
    # Description:
    # Given an integer array nums of length n where all the integers of nums are in the range [1, n] and each integer appears once or twice,
    # return an array of all the integers that appears twice.
    #
    # You must write an algorithm that runs in O(n) time and uses only constant extra space.
    #
    # Examples:
    # Input: nums = [4, 3, 2, 7, 8, 2, 3, 1]
    # Output: [2, 3]
    #
    # Input: nums = [1, 1, 2]
    # Output: [1]
    #
    # Input: nums = [1]
    # Output: []
    #
    # @param {Array<Integer>} nums
    # @return {Array<Integer>}
    def find_duplicates(nums)
      result = private_methods.grep(/^find_duplicates_\d+$/).map { |m| send(m, nums.clone) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def find_duplicates_1(nums)
      result = []

      nums.each_with_object(Set.new) { |num, set|
        result.push(num) if !set.add?(num)
      }

      result
    end

    def find_duplicates_2(nums)
      result = []

      nums.each { |num|
        result.push(num.abs) if nums[num.abs - 1] < 0
        nums[num.abs - 1] = -nums[num.abs - 1].abs
      }

      result
    end
  end
end
