# frozen_string_literal: true

module LeetCode
  # 62. Unique Paths
  module LC62
    # Description:
    # There is a robot on an m x n grid. The robot is initially located at the top-left corner (i.e., grid[0][0]).
    # The robot tries to move to the bottom-right corner (i.e., grid[m - 1][n - 1]).
    # The robot can only move either down or right at any point in time.
    #
    # Given the two integers m and n, return the number of possible unique paths that the robot can take to reach the bottom-right corner.
    #
    # The test cases are generated so that the answer will be less than or equal to 2 * 109.
    #
    # Examples:
    # Input: m = 3, n = 7
    # Output: 28
    #
    # Input: m = 3, n = 2
    # Output: 3
    #
    # @param {Integer} m
    # @param {Integer} n
    # @return {Integer}
    def unique_paths(m, n)
      result = Array.new(m) { Array.new(n, 1) }

      (1...m).each { |r|
        (1...n).each { |c|
          result[r][c] = result[r][c - 1] + result[r - 1][c]
        }
      }

      result[-1][-1]
    end
  end
end
