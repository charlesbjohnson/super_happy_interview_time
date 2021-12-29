# frozen_string_literal: true

module LeetCode
  # 1299. Replace Elements with Greatest Element on Right Side
  module LC1299
    # Description:
    # Given an array arr, replace every element in that array with the greatest element among the elements to its right,
    # and replace the last element with -1.
    #
    # After doing so, return the array.
    #
    # Examples:
    # Input: arr = [17, 18, 5, 4, 6, 1]
    # Output: [18, 6, 6, 6, 1, -1]
    #
    # Input: arr = [400]
    # Output: [-1]
    #
    # @param {Array<Integer>} arr
    # @return {Array<Integer>}
    def replace_elements(arr)
      return arr if arr.empty?

      max = arr[-1]
      arr[-1] = -1

      i = arr.length - 2

      while i >= 0
        prev_max = max
        max = [arr[i], prev_max].max

        arr[i] = prev_max

        i -= 1
      end

      arr
    end
  end
end
