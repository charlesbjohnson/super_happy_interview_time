# frozen_string_literal: true

module LeetCode
  # 33. Search in Rotated Sorted Array
  module LC33
    # Description:
    # Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
    # You are given a target value to search. If found in the array return its index, otherwise return -1.
    #
    # Examples:
    # Input: list = [4, 5, 6, 7, 0, 1, 2], target = 2
    # Output: 6
    #
    # Notes:
    # - You may assume no duplicate exists in the array.
    #
    # @param list {Array<Integer>}
    # @param target {Integer}
    # @return {Integer}
    def search(list, target)
      low = 0
      high = list.length - 1

      while low <= high
        mid = low + ((high - low) / 2)

        return mid if list[mid] == target

        if list[mid] > target
          # (normal: in left) or (rotated: in left ie. [5, 1, 2, 3, 4], 1)
          if list[low] <= target || list[low] > list[mid]
            high = mid - 1
          else # rotated: normally left, in right ie. [3, 4, 5, 1, 2], 1
            low = mid + 1
          end

          next
        end

        if list[mid] < target
          # (normal: in right) or (rotated: in right ie. [2, 3, 4, 5, 1], 5)
          if list[high] >= target || list[high] < list[mid]
            low = mid + 1
          else # rotated: normally right, in left ie. [5, 4, 1, 2, 3], 4
            high = mid - 1
          end

          next
        end

        break
      end

      -1
    end
  end
end
