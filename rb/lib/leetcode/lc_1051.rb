# frozen_string_literal: true

module LeetCode
  # 1051. Height Checker
  module LC1051
    # Description:
    # A school is trying to take an annual photo of all the students.
    # The students are asked to stand in a single file line in non-decreasing order by height.
    # Let this ordering be represented by the integer array expected where expected[i] is the expected height of the ith student in line.
    #
    # You are given an integer array heights representing the current order that the students are standing in. Each heights[i] is the height of the ith student in line (0-indexed).
    #
    # Return the number of indices where heights[i] != expected[i].
    #
    # Examples:
    # Input: heights = [1, 1, 4, 2, 1, 3]
    # Output: 3
    #
    # Input: heights = [5, 1, 2, 3, 4]
    # Output: 5
    #
    # Input: heights = [1, 2, 3, 4, 5]
    # Output: 0
    #
    # @param {Array<Integer>} heights
    # @return {Integer}
    def height_checker(heights)
      heights.sort.each_with_index.count { |v, i| v != heights[i] }
    end
  end
end
