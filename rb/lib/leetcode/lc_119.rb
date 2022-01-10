# frozen_string_literal: true

module LeetCode
  # 119. Pascal's Triangle II
  module LC119
    # Description:
    # Given an integer row_index, return the row_indexth (0-indexed) row of the Pascal's triangle.
    #
    # In Pascal's triangle, each number is the sum of the two numbers directly above it as shown:
    #
    #     1
    #    1 1
    #   1 2 1
    #  1 3 3 1
    # 1 4 6 4 1
    #
    # Examples:
    # Input: row_index = 3
    # Output: [1, 3, 3, 1]
    #
    # Input: row_index = 0
    # Output: [1]
    #
    # Input: row_index = 1
    # Output: [1, 1]
    #
    # @param {Integer} row_index
    # @return {Array<Integer>}
    def get_row(row_index)
      result = Array.new(row_index + 1)

      (0...result.length).each { |i|
        result[0] = 1
        result[i] = 1

        (i - 1).downto(1) { |j|
          result[j] = result[j] + result[j - 1]
        }
      }

      result
    end
  end
end
