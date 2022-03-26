# frozen_string_literal: true

module LeetCode
  # 238. Product of Array Except Self
  module LC238
    # Description:
    # Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].
    # The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.
    #
    # You must write an algorithm that runs in O(n) time and without using the division operation.
    #
    # Follow up: Can you solve the problem in O(1) extra space complexity?
    # (The output array does not count as extra space for space complexity analysis.)
    #
    # Examples:
    # Input: nums = [1, 2, 3, 4]
    # Output: [24, 12, 8, 6]
    #
    # Input: nums = [-1, 1, 0, -3, 3]
    # Output: [0, 0, 9, 0, 0]
    #
    # @param {Array<Integer>} nums
    # @return {Array<Integer>}
    def product_except_self(nums)
      result = Array.new(nums.length, 1)

      l_product = 1
      r_product = 1

      (0...nums.length).each { |i|
        result[i] *= l_product
        result[-(i + 1)] *= r_product

        l_product *= nums[i]
        r_product *= nums[-(i + 1)]
      }

      result
    end
  end
end
