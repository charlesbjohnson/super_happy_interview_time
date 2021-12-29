# frozen_string_literal: true

module LeetCode
  # 941. Valid Mountain Array
  module LC941
    # Description:
    # Given an array of integers arr, return true if and only if it is a valid mountain array.
    #
    # Recall that arr is a mountain array if and only if:
    #
    # - arr.length >= 3
    # - There exists some i with 0 < i < arr.length - 1 such that:
    #   - arr[0] < arr[1] < ... < arr[i - 1] < arr[i]
    #   - arr[i] > arr[i + 1] > ... > arr[arr.length - 1]
    #
    # Examples:
    # Input: arr = [2, 1]
    # Output: false
    #
    # Input: arr = [3, 5, 5]
    # Output: false
    #
    # Input: arr = [0, 3, 2, 1]
    # Output: true
    #
    # @param {Array<Integer>} arr
    # @return {Boolean}
    def valid_mountain_array(arr)
      return false if arr.length < 3

      i = 1
      i += 1 while i < arr.length && arr[i] > arr[i - 1]

      return false if i == 1 || i >= arr.length

      i += 1 while i < arr.length && arr[i] < arr[i - 1]
      i == arr.length
    end
  end
end
