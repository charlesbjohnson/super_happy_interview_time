# frozen_string_literal: true

module LeetCode
  # 118. Pascal's Triangle
  module LC118
    # Description:
    # Given an integer num_rows, return the first num_rows of Pascal's triangle.
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
    # Input: num_rows = 5
    # Output: [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1]]
    #
    # Input: num_rows = 1
    # Output: [[1]]
    #
    # @param {Integer} num_rows
    # @return {Array<Array<Integer>>}
    def generate(num_rows)
      result = Array.new(num_rows) { |i|
        Array.new(i + 1) { |j| j == 0 || j == i ? 1 : nil }
      }

      (2...result.length).each { |r|
        (1...(result[r].length - 1)).each { |c|
          result[r][c] = result[r - 1][c - 1] + result[r - 1][c]
        }
      }

      result
    end
  end
end
