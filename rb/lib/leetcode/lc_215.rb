# frozen_string_literal: true

module LeetCode
  # 215. Kth Largest Element in an Array
  module LC215
    # Description:
    # Find the kth largest element in an unsorted array. Note that it is the kth largest element in the sorted order, not the kth distinct element.
    #
    # Examples:
    # Input: list = [3, 2, 1, 5, 6, 4], k = 2
    # Output: 5
    #
    # Notes:
    # - You may assume k is always valid, 1 <= k <= array's length.
    #
    # @param list {Array<Integer>}
    # @param k {Integer}
    # @return {Integer}
    def find_kth_largest(list, k)
      return if k > list.length
      list.sort.reverse[k - 1]
    end
  end
end
