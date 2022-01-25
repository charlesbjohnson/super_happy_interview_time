# frozen_string_literal: true

module LeetCode
  # 347. Top K Frequent Elements
  module LC347
    # Description:
    # Given an integer array nums and an integer k, return the k most frequent elements.
    # You may return the answer in any order.
    #
    # Follow up: Your algorithm's time complexity must be better than O(n log n), where n is the array's size.
    #
    # Examples:
    # Input: list = [1, 1, 1, 2, 2, 3], k = 2
    # Output: [1, 2]
    #
    # Input: nums = [1], k = 1
    # Output: [1]
    #
    # @param {Array<Integer>} nums
    # @param {Integer} k
    # @return {Array<Integer>}
    def top_k_frequent(nums, k)
      tally = nums.tally
      unique = tally.keys

      k = unique.length - k

      lo = 0
      hi = unique.length - 1

      while lo <= hi
        mid = partition(unique, tally, lo, hi)

        break if mid == k

        if mid > k
          hi = mid - 1
        else
          lo = mid + 1
        end
      end

      unique[k..].reverse
    end

    private

    def partition(nums, tally, lo, hi)
      i = lo + 1
      j = hi

      while i <= j
        if tally[nums[i]] <= tally[nums[lo]]
          i += 1
          next
        end

        if tally[nums[j]] > tally[nums[lo]]
          j -= 1
          next
        end

        nums[i], nums[j] = nums[j], nums[i]
      end

      nums[lo], nums[j] = nums[j], nums[lo]

      j
    end
  end
end
