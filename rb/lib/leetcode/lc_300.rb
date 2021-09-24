# typed: false
# frozen_string_literal: true

module LeetCode
  # 300. Longest Increasing Subsequence
  module LC300
    # Description:
    # Given an unsorted array of integers, find the length of longest increasing subsequence.
    #
    # Examples:
    # Input: [10, 9, 2, 5, 3, 7, 101, 18]
    # Output: 4
    # Explanation: [2, 3, 7, 101]
    #
    # Notes:
    # - Note that there may be more than one LIS combination, it is only necessary for you to return the length.
    # - Your algorithm should run in O(n2) complexity.
    # - Could you improve it to O(n log n) time complexity?
    #
    # @param list {Array<Integer}
    # @return {Integer}
    def length_of_lis(list)
      return 0 if list.empty?
      return 1 if list.length == 1

      cache = Array.new(list.length, 0)
      cache[0] = 1

      (1...cache.length).each { |right|
        max = 0

        (0...right).each { |left|
          max = [max, cache[left]].max if list[left] < list[right]
        }

        cache[right] = max + 1
      }

      cache.max
    end
  end
end
