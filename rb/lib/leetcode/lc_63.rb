# frozen_string_literal: true

module LeetCode
  # 63. Unique Paths II
  module LC63
    # Description:
    # A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).
    # The robot can only move either down or right at any point in time.
    # The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).
    #
    # Now consider if some obstacles are added to the grids. How many unique paths would there be?
    #
    # An obstacle and space is marked as 1 and 0 respectively in the grid.
    #
    # Examples:
    # Input: obstacleGrid = [[0, 0, 0], [0, 1, 0], [0, 0, 0]]
    # Output: 2
    #
    # Input: obstacleGrid = [[0, 1], [0, 0]]
    # Output: 1
    #
    # @param {Array<Array<Integer>>} obstacle_grid
    # @return {Integer}
    def unique_paths_with_obstacles(obstacle_grid)
      m = obstacle_grid.length
      n = obstacle_grid[0].length

      cache = Array.new(m) { Array.new(n, 0) }
      cache[0][0] = obstacle_grid[0][0] == 0 ? 1 : 0

      (0...m).each { |r|
        (0...n).each { |c|
          next if obstacle_grid[r][c] == 1

          cache[r][c] += cache[r - 1][c] if r > 0 && obstacle_grid[r - 1][c] == 0
          cache[r][c] += cache[r][c - 1] if c > 0 && obstacle_grid[r][c - 1] == 0
        }
      }

      cache[-1][-1]
    end
  end
end
