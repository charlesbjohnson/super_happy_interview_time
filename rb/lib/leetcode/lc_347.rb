# frozen_string_literal: true

module LeetCode
  # 347. Top K Frequent Elements
  module LC347
    Heap = Helpers::LeetCode::Heap

    # Description:
    # Given an integer array nums and an integer k, return the k most frequent elements.
    # You may return the answer in any order.
    #
    # Examples:
    # Input: nums = [1, 1, 1, 2, 2, 3], k = 2
    # Output: [1, 2]
    #
    # Input: nums = [1], k = 1
    # Output: [1]
    #
    # @param {Array<Integer>} nums
    # @param {Integer} k
    # @return {Array<Integer>}
    def top_k_frequent(nums, k)
      hash = Hash.new(0)
      queue = Heap.new { |a, b| b[0] <=> a[0] }

      nums.each { |num| hash[num] += 1 }
      hash.each { |num, count|
        queue.push([count, num])
        queue.pop if queue.size > k
      }

      k.times.map { queue.pop[1] }
    end
  end
end
