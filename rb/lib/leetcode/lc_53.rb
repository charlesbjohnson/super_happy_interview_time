# typed: true
# frozen_string_literal: true

module LeetCode
  # 53. Maximum Subarray
  module LC53
    MIN = -(2**32 / 2)

    # Description:
    # Find the contiguous subarray within an array (containing at least one number) which has the largest sum.
    #
    # Examples:
    # Input: [-2, 1, -3, 4, -1, 2, 1, -5, 4]
    # Output: 6
    # Explanation: the contiguous subarray [4, -1, 2, 1] has the largest sum = 6.
    #
    # @param list {Array<Integer>}
    # @return {Integer}
    def max_sub_array(list)
      return MIN if list.empty?

      sum = list[0]
      max = list[0]

      (1...list.length).each do |i|
        sum = [sum + list[i], list[i]].max
        max = [sum, max].max
      end

      max
    end
  end
end
