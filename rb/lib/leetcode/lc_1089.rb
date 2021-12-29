# frozen_string_literal: true

module LeetCode
  # 1089. Duplicate Zeros
  module LC1089
    # Description:
    # Given a fixed-length integer array arr, duplicate each occurrence of zero, shifting the remaining elements to the right.
    #
    # Note that elements beyond the length of the original array are not written.
    # Do the above modifications to the input array in place and do not return anything.
    #
    # Examples:
    # Input: arr = [1, 0, 2, 3, 0, 4, 5, 0]
    # Output: [1, 0, 0, 2, 3, 0, 0, 4]
    #
    # Input: arr = [1,2,3]
    # Output: [1,2,3]
    #
    # @param {Array<Integer>} arr
    # @return {nil}
    def duplicate_zeros(arr)
      copy = Array.new(arr.length)

      i = 0
      j = 0

      while i < arr.length && j < arr.length
        if arr[i] != 0
          copy[j] = arr[i]
        else
          copy[j] = 0
          copy[j + 1] = 0 if j + 1 < arr.length

          j += 1
        end

        i += 1
        j += 1
      end

      copy.each_with_index { |v, i| arr[i] = v }
      arr
    end
  end
end
