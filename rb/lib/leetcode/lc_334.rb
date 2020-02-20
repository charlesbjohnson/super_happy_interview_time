# typed: false
# frozen_string_literal: true

module LeetCode
  # 334. Increasing Triplet Subsequence
  module LC334
    # Description:
    # Given an unsorted array return whether an increasing subsequence of length 3 exists or not in the array.
    #
    # Examples:
    # - 1:
    #   Input: [1, 2, 3, 4, 5]
    #   Output: true
    #
    # - 2:
    #   Input: [5, 4, 3, 2, 1]
    #   Output: false
    #
    # Notes:
    # - Return true if there exists i, j, k such that arr[i] < arr[j] < arr[k] given 0 <= i < j < k <= n - 1 else return false.
    # - Your algorithm should run in O(n) time complexity and O(1) space complexity.
    #
    # @param list {Array<Integer>}
    # @return {Boolean}
    def increasing_triplet(list)
      first = Float::INFINITY
      second = Float::INFINITY

      list.each do |n|
        if n <= first
          first = n
          next
        end

        if n <= second
          second = n
          next
        end

        return true
      end

      false
    end
  end
end
