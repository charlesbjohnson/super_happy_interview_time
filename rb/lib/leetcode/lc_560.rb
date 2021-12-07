# frozen_string_literal: true

module LeetCode
  # 560. Subarray Sum Equals K
  module LC560
    # Description:
    # Given an array of integers and an integer k, you need to find the total number of continuous subarrays whose sum equals to k.
    #
    # Examples:
    # Input: list = [1, 1, 1], sum = 2
    # Output: 2
    #
    # Notes:
    # - The length of the array is in range [1, 20,000].
    # - The range of numbers in the array is [-1000, 1000] and the range of the integer k is [-1e7, 1e7].
    #
    # @param list {Array<Integer>}
    # @param k {Integer}
    # @return {Integer}
    def subarray_sum(list, k)
      result = 0

      sums = {0 => 1}
      sum = 0

      list.each { |v|
        sum += v
        result += sums.fetch(sum - k, 0)
        sums[sum] = sums.fetch(sum, 0) + 1
      }

      result
    end
  end
end
