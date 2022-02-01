# frozen_string_literal: true

module LeetCode
  # 215. Kth Largest Element in an Array
  module LC215
    MinHeap = Helpers::LeetCode::MinHeap

    # Description:
    # Given an integer array nums and an integer k, return the kth largest element in the array.
    #
    # Note that it is the kth largest element in the sorted order, not the kth distinct element.
    #
    # Examples:
    # Input: nums = [3, 2, 1, 5, 6, 4], k = 2
    # Output: 5
    #
    # Input: nums = [3, 2, 3, 1, 2, 4, 5, 5, 6], k = 4
    # Output: 4
    #
    # @param {Array<Integer>} nums
    # @param {Integer} k
    # @return {Integer}
    def find_kth_largest(nums, k)
      heap = MinHeap.new

      nums.each { |num|
        heap.push(num)
        heap.pop if heap.size > k
      }

      heap.min
    end
  end
end
