# typed: true
# frozen_string_literal: true

module LeetCode
  # 64. Minimum Path Sum
  module LC64
    # Description:
    # Given a m x n grid filled with non-negative numbers,
    # find a path from top left to bottom right which minimizes the sum of all numbers along its path.
    #
    # Examples:
    # Input: [
    #   [1, 3, 1],
    #   [1, 5, 1],
    #   [4, 2, 1]
    # ]
    # Output: 7
    # Explanation: 1->3->1->1->1
    #
    # Notes:
    # - You can only move either down or right at any point in time.
    #
    # @param grid {Array<Array<Integer>}
    # @return {Integer}
    def min_path_sum(grid)
      return 0 if grid.empty?
      return 0 if grid[0].empty?

      rows = grid.length
      cols = grid[0].length

      (1...rows).each { |row|
        grid[row][0] += grid[row - 1][0]
      }

      (1...cols).each { |col|
        grid[0][col] += grid[0][col - 1]
      }

      (1...rows).each { |row|
        (1...cols).each { |col|
          grid[row][col] += [grid[row - 1][col], grid[row][col - 1]].min
        }
      }

      grid[rows - 1][cols - 1]
    end
  end
end
