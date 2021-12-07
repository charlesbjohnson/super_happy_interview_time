# frozen_string_literal: true

module LeetCode
  # 34. Search for a Range
  module LC34
    def binary_search(list, target, low, high)
      while low <= high
        mid = low + ((high - low) / 2)

        return mid if list[mid] == target

        if list[mid] < target
          low = mid + 1
        else
          high = mid - 1
        end
      end

      nil
    end

    def left_search(list, target, found)
      found_left = found
      prev = nil

      while found_left
        prev = found_left
        found_left = binary_search(list, target, 0, found_left - 1)
      end

      prev
    end

    def right_search(list, target, found)
      found_right = found
      prev = nil

      while found_right
        prev = found_right
        found_right = binary_search(list, target, found_right + 1, list.length - 1)
      end

      prev
    end

    # Description:
    # Given an array of integers sorted in ascending order, find the starting and ending position of a given target value.
    #
    # Examples:
    # Input: list = [5, 7, 7, 8, 8, 10], target = 8
    # Output: [3, 4]
    #
    # Input: list = [1, 2, 2, 3], target = 4
    # Output: [-1, -1]
    #
    # Notes:
    # - Your algorithm's runtime complexity must be in the order of O(log n).
    #
    # @param list {Array<Integer>}
    # @param target {Array<Integer>}
    # @return {Array<Integer>}
    def search_range(list, target)
      found = binary_search(list, target, 0, list.length - 1)
      return [-1, -1] unless found

      left_bound = left_search(list, target, found)
      right_bound = right_search(list, target, found)

      [left_bound, right_bound]
    end
  end
end
