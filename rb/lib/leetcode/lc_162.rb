# typed: true
# frozen_string_literal: true

module LeetCode
  # 162. Find Peak Element
  module LC162
    # Description:
    # A peak element is an element that is greater than its neighbors.
    # Given an input array where num[i] != num[i + 1], find a peak element and return its index.
    #
    # Examples:
    # Input: [1, 2, 3, 1]
    # Output: 2
    #
    # Notes:
    # - The array may contain multiple peaks, in that case return the index to any one of the peaks is fine.
    # - You may assume that num[-1] == num[n] == -Infinity.
    # - Your solution should be in logarithmic complexity.
    #
    # @param list {Array<Integer>}
    # @return {Integer}
    def find_peak_element(list)
      return if list.empty?

      low = 0
      high = list.length - 1

      while low < high
        mid = low + ((high - low) / 2)

        greater_than_previous = mid.zero? || list[mid] > list[mid - 1]
        greater_than_next = mid == list.length - 1 || list[mid] > list[mid + 1]

        return mid if greater_than_previous && greater_than_next

        if greater_than_previous
          low = mid + 1
        else
          high = mid
        end
      end

      low
    end
  end
end
