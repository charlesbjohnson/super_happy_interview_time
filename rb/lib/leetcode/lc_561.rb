# frozen_string_literal: true

module LeetCode
  # 561. Array Partition I
  module LC561
    # Description:
    # Given an integer array nums of 2n integers, group these integers into n pairs (a1, b1), (a2, b2), ..., (an, bn)
    # such that the sum of min(ai, bi) for all i is maximized.
    #
    # Return the maximized sum.
    #
    # Examples:
    # Input: nums = [1, 4, 3, 2]
    # Output: 4
    #
    # Input: nums = [6, 2, 6, 5, 1, 2]
    # Output: 9
    #
    # @param {Array<Integer>} nums
    # @return {Integer}
    def array_pair_sum(nums)
      nums.sort!

      sum = 0
      i = 0

      while i < (nums.length / 2)
        sum += [nums[i * 2], nums[(i * 2) + 1]].min
        i += 1
      end

      sum
    end
  end
end
