# frozen_string_literal: true

module LeetCode
  # 152. Maximum Product Subarray
  module LC152
    # Description:
    # Given an integer array nums, find a contiguous non-empty subarray within the array that has the largest product,
    # and return the product.
    #
    # The test cases are generated so that the answer will fit in a 32-bit integer.
    #
    # A subarray is a contiguous subsequence of the array.
    #
    # Examples:
    # Input: nums = [2, 3, -2, 4]
    # Output: 6
    #
    # Input: nums = [-2, 0, -1]
    # Output: 0
    #
    # @param {Array<Integer>} nums
    # @return {Integer}
    def max_product(nums)
      result = private_methods.grep(/^max_product_\d+$/).map { |m| send(m, nums) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def max_product_1(nums)
      result = -Float::INFINITY
      cache = {}

      rec = ->(i) {
        return [1, 1] if i == nums.length

        cache[i] ||= [
          nums[i] * rec.call(i + 1)[0],
          nums[i] * rec.call(i + 1)[1],
          nums[i]
        ].minmax

        result = [result, cache[i][1]].max
        cache[i]
      }

      rec.call(0)
      result
    end

    def max_product_2(nums)
      cache = Array.new(nums.length + 1) { |i| i == nums.length ? [1, 1] : nil }

      (nums.length - 1).downto(0) { |i|
        cache[i] = [
          nums[i] * cache[i + 1][0],
          nums[i] * cache[i + 1][1],
          nums[i]
        ].minmax
      }

      cache[...-1].max_by(&:last)[1]
    end

    def max_product_3(nums)
      result = -Float::INFINITY
      minmax = [1, 1]

      (nums.length - 1).downto(0) { |i|
        minmax = [
          nums[i] * minmax[0],
          nums[i] * minmax[1],
          nums[i]
        ].minmax

        result = [result, minmax[1]].max
      }

      result
    end
  end
end
