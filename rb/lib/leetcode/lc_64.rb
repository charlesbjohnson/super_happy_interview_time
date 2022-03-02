# frozen_string_literal: true

module LeetCode
  # 64. Minimum Path Sum
  module LC64
    # Description:
    # Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right,
    # which minimizes the sum of all numbers along its path.
    #
    # Note: You can only move either down or right at any point in time.
    #
    # Examples:
    # Input: grid = [[1, 3, 1], [1, 5, 1], [4, 2, 1]]
    # Output: 7
    #
    # Input: grid = [[1, 2, 3], [4, 5, 6]]
    # Output: 12
    #
    # @param {Array<Array<Integer>>} grid
    # @return {Integer}
    def min_path_sum(grid)
      m = grid.length
      n = grid[0].length

      result = Array.new(m) { |r| Array.new(n) { |c| grid[r][c] } }

      (0...m).each { |r|
        (0...n).each { |c|
          next if r == 0 && c == 0

          result[r][c] += [
            r > 0 ? result[r - 1][c] : Float::INFINITY,
            c > 0 ? result[r][c - 1] : Float::INFINITY
          ].min
        }
      }

      result[-1][-1]
    end
  end
end
