# frozen_string_literal: true

module LeetCode
  # 852. Peak Index in a Mountain Array
  module LC852
    # Description:
    # Let's call an array arr a mountain if the following properties hold:
    # - arr.length >= 3
    # - There exists some i with 0 < i < arr.length - 1 such that:
    #   - arr[0] < arr[1] < ... arr[i-1] < arr[i]
    #   - arr[i] > arr[i+1] > ... > arr[arr.length - 1]
    #
    # Given an integer array arr that is guaranteed to be a mountain,
    # return any i such that arr[0] < arr[1] < ... arr[i - 1] < arr[i] > arr[i + 1] > ... > arr[arr.length - 1].
    #
    # Follow up: Finding the O(n) is straightforward, could you find an O(log(n)) solution?
    #
    # Examples:
    # Input: arr = [0, 1, 0]
    # Output: 1
    #
    # Input: arr = [0, 2, 1, 0]
    # Output: 1
    #
    # Input: arr = [0, 10, 5, 2]
    # Output: 1
    #
    # @param {Array<Integer>} arr
    # @return {Integer}
    def peak_index_in_mountain_array(arr)
      lo = 1
      hi = arr.length - 2

      while lo <= hi
        mid = ((hi - lo) / 2) + lo

        if arr[mid - 1] < arr[mid] && arr[mid + 1] < arr[mid]
          return mid
        elsif arr[mid - 1] > arr[mid]
          hi = mid - 1
        elsif arr[mid + 1] > arr[mid]
          lo = mid + 1
        end
      end

      raise
    end
  end
end
