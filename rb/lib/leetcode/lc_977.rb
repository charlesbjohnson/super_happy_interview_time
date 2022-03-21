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
      result = Array.new(nums.length)

      l = 0
      r = nums.length - 1

      i = result.length - 1

      while i >= 0
        case nums[l].abs <=> nums[r].abs
        when 1, 0
          result[i] = nums[l]
          l += 1
        when -1
          result[i] = nums[r]
          r -= 1
        end

        result[i] = result[i]**2
        i -= 1
      end

      result
    end
  end
end
