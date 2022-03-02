# frozen_string_literal: true

module LeetCode
  # 918. Maximum Sum Circular Subarray
  module LC918
    # Description:
    # Given a circular integer array nums of length n, return the maximum possible sum of a non-empty subarray of nums.
    #
    # A circular array means the end of the array connects to the beginning of the array.
    # Formally, the next element of nums[i] is nums[(i + 1) % n] and the previous element of nums[i] is nums[(i - 1 + n) % n].
    #
    # A subarray may only include each element of the fixed buffer nums at most once.
    # Formally, for a subarray nums[i], nums[i + 1], ..., nums[j], there does not exist i <= k1, k2 <= j with k1 % n == k2 % n.
    #
    # Examples:
    # Input: nums = [1, -2, 3, -2]
    # Output: 3
    #
    # Input: nums = [5, -3, 5]
    # Output: 10
    #
    # Input: nums = [-3, -2, -3]
    # Output: -2
    #
    # @param {Array<Integer>} nums
    # @return {Integer}
    def max_subarray_sum_circular(nums)
      max_subarray = -> {
        cur = 0
        max = -Float::INFINITY

        nums.each { |num|
          cur = [num, cur + num].max
          max = [max, cur].max
        }

        max
      }

      min_subarray = -> {
        return 0 if nums.length <= 2

        cur = 0
        min = Float::INFINITY

        nums[1..-2].each { |num|
          cur = [num, cur + num].min
          min = [min, cur].min
        }

        min
      }

      [
        max_subarray.call,
        nums.sum - min_subarray.call
      ].max
    end
  end
end
