# frozen_string_literal: true

module LeetCode
  # 977. Squares of a Sorted Array
  module LC977
    # Description:
    # Given an integer array nums sorted in non-decreasing order,
    # return an array of the squares of each number sorted in non-decreasing order.
    #
    # Follow up: Squaring each element and sorting the new array is very trivial,
    # could you find an O(n) solution using a different approach?
    #
    # Examples:
    # Input: nums = [-4, -1, 0, 3, 10]
    # Output: [0, 1, 9, 16, 100]
    #
    # Input: nums = [-7, -3, 2, 3, 11]
    # Output: [4, 9, 9, 49, 121]
    #
    # @param {Array<Integer>} nums
    # @return {Array<Integer>}
    def sorted_squares(nums)
      left_i = 0
      right_i = nums.length - 1

      sorted = Array.new(nums.length)
      i = sorted.length - 1

      while i >= 0
        left_num = nums[left_i].abs
        right_num = nums[right_i].abs

        if right_num < left_num
          sorted[i] = left_num**2
          left_i += 1
        elsif right_num >= left_num
          sorted[i] = right_num**2
          right_i -= 1
        end

        i -= 1
      end

      sorted
    end
  end
end
