# typed: false
# frozen_string_literal: true

module LeetCode
  # 581. Shortest Unsorted Continuous Subarray
  module LC581
    # Description:
    # Given an integer array, find one continuous subarray such that if the subarray is sorted in ascending order, then the whole array will be sorted in ascending order.
    # Find the shortest such subarray and output its length.
    #
    # Examples:
    # Input: [2, 6, 4, 8, 10, 9, 15]
    # Output: 5
    # Explanation: Sorting [6, 4, 8, 10, 9] in ascending order makes the whole array sorted in ascending order.
    #
    # Notes:
    # - Then length of the input array is in range [1, 10000].
    # - The input array may contain duplicates.
    #
    # @param list {Array<Integer>}
    # @return {Integer}
    def find_unsorted_subarray(list)
      sorted = list.sort

      left = list.length
      right = 0

      list.each_index { |i|
        next if list[i] == sorted[i]

        left = [left, i].min
        right = [right, i].max
      }

      (right - left).positive? ? (right - left + 1) : 0
    end
  end
end
