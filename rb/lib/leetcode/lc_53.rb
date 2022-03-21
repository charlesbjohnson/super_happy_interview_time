# frozen_string_literal: true

module LeetCode
  # 53. Maximum Subarray
  module LC53
    # Description:
    # Given an integer array nums, find the contiguous subarray (containing at least one number)
    # which has the largest sum and return its sum.
    #
    # A subarray is a contiguous part of an array.
    #
    # Follow up: If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach,
    # which is more subtle.
    #
    # Examples:
    # Input: nums = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
    # Output: 6
    #
    # Input: nums = [1]
    # Output: 1
    #
    # Input: nums = [5, 4, -1, 7, 8]
    # Output: 23
    #
    # @param {Array<Integer>} nums
    # @return {Integer}
    def max_sub_array(nums)
      result = private_methods.grep(/^max_sub_array_\d+$/).map { |m| send(m, nums) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def max_sub_array_1(nums)
      cache = {}

      rec = ->(i) {
        return 0 if i == nums.length

        cache[i] ||= [nums[i], nums[i] + rec.call(i + 1)].max
      }

      rec.call(0)
      cache.values.max
    end

    def max_sub_array_2(nums)
      result = Array.new(nums.length + 1, -Float::INFINITY)

      (nums.length - 1).downto(0) { |i|
        result[i] = [nums[i], nums[i] + result[i + 1]].max
      }

      result.max
    end

    def max_sub_array_3(nums)
      current = 0
      result = -Float::INFINITY

      nums.each { |num|
        current = [num, num + current].max
        result = [result, current].max
      }

      result
    end
  end
end
