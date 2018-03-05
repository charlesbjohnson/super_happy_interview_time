# frozen_string_literal: true

module LeetCode
  # 88. Merge Sorted Array
  module LC88
    # Description:
    # Given two sorted integer arrays left and right, merge right into left as one sorted array.
    #
    # Notes:
    # You may assume that left has enough space (size that is greater or equal to m + n) to hold additional elements from right.
    # The number of elements initialized in left and right are m and n respectively.
    #
    # @param left {Array<Integer>}
    # @param length_left {Integer}
    # @param left {Array<Integer>}
    # @param length_right {Integer}
    # @return {nil}
    def merge(left, length_left, right, length_right)
      l_cursor = length_left - 1
      r_cursor = length_right - 1

      cursor = length_left + length_right - 1

      while l_cursor >= 0 && r_cursor >= 0
        if left[l_cursor] > right[r_cursor]
          left[cursor] = left[l_cursor]
          l_cursor -= 1
        else
          left[cursor] = right[r_cursor]
          r_cursor -= 1
        end

        cursor -= 1
      end

      while r_cursor >= 0
        left[cursor] = right[r_cursor]
        r_cursor -= 1
        cursor -= 1
      end
    end
  end
end
