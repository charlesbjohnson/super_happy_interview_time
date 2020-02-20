# typed: false
# frozen_string_literal: true

module LeetCode
  # 287. Find the Duplicate Number
  module LC287
    # Description:
    # Given an array nums containing n + 1 integers where each integer is between 1 and n (inclusive), prove that at least one duplicate number must exist.
    # Assume that there is only one duplicate number, find the duplicate one.
    #
    # Notes:
    # - You must not modify the array (assume the array is read only).
    # - You must use only constant, O(1) extra space.
    # - Your runtime complexity should be less than O(n^2).
    # - There is only one duplicate number in the array, but it could be repeated more than once.
    #
    # @param list {Array<Integer>}
    # @return {Integer}
    def find_duplicate(list)
      left = list[0]
      right = list[0]

      loop do
        left = list[left]
        right = list[list[right]]
        break if left == right
      end

      right = left
      left = list[0]

      until left == right
        left = list[left]
        right = list[right]
      end

      left
    end
  end
end
