# frozen_string_literal: true

module LeetCode
  # 303. Range Sum Query - Immutable
  module LC303
    # Description:
    # Given an integer array nums, handle multiple queries of the following type:
    # - Calculate the sum of the elements of nums between indices left and right inclusive where left <= right.
    #
    # Implement the NumArray class:
    # - NumArray(int[] nums) Initializes the object with the integer array nums.
    # - int sumRange(int left, int right) Returns the sum of the elements of nums between indices left and right inclusive (i.e. nums[left] + nums[left + 1] + ... + nums[right]).
    #
    # Examples:
    # Input:
    # ["NumArray", "sumRange", "sumRange", "sumRange"]
    # [[[-2,  0,  3,  -5,  2,  -1]],  [0,  2],  [2,  5],  [0,  5]]
    # Output:
    # [null, 1, -1, -3]
    class NumArray
      # @param {Array<Integer>} nums
      def initialize(nums)
        self.cache = Array.new(nums.length)

        (0...nums.length).each { |i|
          cache[i] = nums[i] + (i == 0 ? 0 : cache[i - 1])
        }
      end

      # @param {Integer} left
      # @param {Integer} right
      # @return {Integer}
      def sum_range(left, right)
        cache[right] - (left > 0 ? cache[left - 1] : 0)
      end

      private

      attr_accessor(:cache)
    end
  end
end
