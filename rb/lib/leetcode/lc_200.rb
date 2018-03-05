# frozen_string_literal: true

module LeetCode
  # 200. Number of Islands
  module LC200
    def num_islands_recurse(grid, row, col)
      return unless (0...grid.length).cover?(row)
      return unless (0...grid[row].length).cover?(col)
      return unless grid[row][col] == '1'

      grid[row][col] = '0'

      num_islands_recurse(grid, row + 1, col)
      num_islands_recurse(grid, row - 1, col)
      num_islands_recurse(grid, row, col + 1)
      num_islands_recurse(grid, row, col - 1)
    end

    # Description:
    # Given a 2d grid map of '1's (land) and '0's (water), count the number of islands.
    # An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically.
    # You may assume all four edges of the grid are all surrounded by water.
    #
    # Examples:
    # - 1:
    #   Input:
    #     11110
    #     11010
    #     11000
    #     00000
    #   Output: 1
    #
    # - 2:
    #   Input:
    #     11000
    #     11000
    #     00100
    #     00011
    #   Output: 3
    #
    # @param grid {Array<Array<String>>}
    # @return {Integer}
    def num_islands(grid)
      return 0 if grid.empty?

      count = 0

      (0...grid.length).each do |row|
        (0...grid[row].length).each do |col|
          if grid[row][col] == '1'
            num_islands_recurse(grid, row, col)
            count += 1
          end
        end
      end

      count
    end
  end
end
