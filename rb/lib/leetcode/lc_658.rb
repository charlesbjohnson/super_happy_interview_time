# frozen_string_literal: true

module LeetCode
  # 658. Find K Closest Elements
  module LC658
    # Description:
    # Given a sorted integer array arr, two integers k and x, return the k closest integers to x in the array.
    # The result should also be sorted in ascending order.
    #
    # An integer a is closer to x than an integer b if:
    # - |a - x| < |b - x|, or
    # - |a - x| == |b - x| and a < b
    #
    # Examples:
    # Input: arr = [1, 2, 3, 4, 5], k = 4, x = 3
    # Output: [1, 2, 3, 4]
    #
    # Input: arr = [1, 2, 3, 4, 5], k = 4, x = -1
    # Output: [1, 2, 3, 4]
    #
    # @param {Array<Integer>} arr
    # @param {Integer} k
    # @param {Integer} x
    # @return {Array<Integer>}
    def find_closest_elements(arr, k, x)
      lo = 0
      hi = arr.length - k

      while lo + 1 < hi
        mid = ((hi - lo) / 2) + lo

        if arr[mid] == arr[mid + k]
          if arr[mid] > x
            hi = mid
          else
            lo = mid
          end
        elsif (x - arr[mid]).abs <= (x - arr[mid + k]).abs
          hi = mid
        else
          lo = mid
        end
      end

      i = (x - arr[lo]).abs <= (x - arr[hi + k - 1]).abs ? lo : hi
      arr[i...(i + k)]
    end
  end
end
