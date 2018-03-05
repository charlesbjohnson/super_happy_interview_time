# frozen_string_literal: true

module LeetCode
  # 62. Unique Paths
  module LC62
    # Description:
    # A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).
    # The robot can only move either down or right at any point in time.
    # The robot is trying to reach the bottom-right corner of the grid.
    # How many possible unique paths are there?
    #
    # Notes:
    # - rows and columns will be at most 100
    #
    # @param rows {Integer}
    # @param columns {Integer}
    # @return {Integer}
    def unique_paths(rows, columns)
      return 0 if rows.zero? || columns.zero?

      grid = Array.new(rows) { Array.new(columns) }

      grid.each_index { |row| grid[row][0] = 1 }
      grid[0].each_index { |col| grid[0][col] = 1 }

      (1...grid.length).each do |row|
        (1...grid[row].length).each do |col|
          grid[row][col] = grid[row - 1][col] + grid[row][col - 1]
        end
      end

      grid[rows - 1][columns - 1]
    end
  end
end
