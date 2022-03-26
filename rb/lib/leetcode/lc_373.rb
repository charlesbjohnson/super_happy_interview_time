# frozen_string_literal: true

module LeetCode
  # 373. Find K Pairs with Smallest Sums
  module LC373
    Heap = Helpers::LeetCode::Heap

    # Description:
    # You are given two integer arrays nums1 and nums2 sorted in ascending order and an integer k.
    # Define a pair (u, v) which consists of one element from the first array and one element from the second array.
    #
    # Return the k pairs (u1, v1), (u2, v2), ..., (uk, vk) with the smallest sums.
    #
    # Examples:
    # Input: nums1 = [1, 7, 11], nums2 = [2, 4, 6], k = 3
    # Output: [[1, 2], [1, 4], [1, 6]]
    #
    # Input: nums1 = [1, 1, 2], nums2 = [1, 2, 3], k = 2
    # Output: [[1, 1], [1, 1]]
    #
    # Input: nums1 = [1, 2], nums2 = [3], k = 3
    # Output: [[1, 3], [2, 3]]
    #
    # @param {Array<Integer>} nums1
    # @param {Array<Integer>} nums2
    # @param {Integer} k
    # @return {Array<Array<(Integer, Integer)>>}
    def k_smallest_pairs(nums1, nums2, k)
      result = []
      heap = Heap.new([[0, 0]]) { |a, b| (nums1[a[0]] + nums2[a[1]]) <=> (nums1[b[0]] + nums2[b[1]]) }

      while !heap.empty? && result.length < k
        i, j = heap.pop

        heap.push([i + 1, j]) if i + 1 < nums1.length && j == 0
        heap.push([i, j + 1]) if j + 1 < nums2.length

        result.push([nums1[i], nums2[j]])
      end

      result
    end
  end
end
