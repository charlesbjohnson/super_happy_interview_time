# frozen_string_literal: true

module LeetCode
  # 713. Subarray Product Less Than K
  module LC713
    # Description:
    # Given an array of integers nums and an integer k,
    # return the number of contiguous subarrays where the product of all the elements in the subarray is strictly less than k.
    #
    # Examples:
    # Input: nums = [10, 5, 2, 6], k = 100
    # Output: 8
    #
    # Input: nums = [1, 2, 3], k = 0
    # Output: 0
    #
    # @param {Array<Integer>} nums
    # @param {Integer} k
    # @return {Integer}
    def num_subarray_product_less_than_k(nums, k)
      return 0 if k <= 1

      result = 0

      i = 0
      j = 0

      product = 1

      while j < nums.length
        product *= nums[j]
        j += 1

        while product >= k
          product /= nums[i]
          i += 1
        end

        result += j - i
      end

      result
    end
  end
end
