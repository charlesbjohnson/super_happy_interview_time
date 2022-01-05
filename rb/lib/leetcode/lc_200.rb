# frozen_string_literal: true

module LeetCode
  # 200. Number of Islands
  module LC200
    # Description:
    # Given an m x n 2D binary grid grid which represents a map of '1's (land) and '0's (water),
    # return the number of islands.
    #
    # An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically.
    # You may assume all four edges of the grid are all surrounded by water.
    #
    # Examples:
    # Input: grid = [
    #   ["1","1","1","1","0"],
    #   ["1","1","0","1","0"],
    #   ["1","1","0","0","0"],
    #   ["0","0","0","0","0"]
    # ]
    # Output: 1
    #
    # Input: grid = [
    #   ["1","1","0","0","0"],
    #   ["1","1","0","0","0"],
    #   ["0","0","1","0","0"],
    #   ["0","0","0","1","1"]
    # ]
    # Output: 3
    #
    # @param {Array<Array<String>>} grid
    # @return {Integer}
    def num_islands(grid)
      islands = 0

      (0...grid.length).each { |row|
        (0...grid[row].length).each { |col|
          if grid[row][col] == "1"
            sink_island(grid, row, col)
            islands += 1
          end
        }
      }

      islands
    end

    private

    def sink_island(grid, row, col)
      stack = [[row, col]]

      until stack.empty?
        row, col = stack.pop

        if (0...grid.length).cover?(row) && (0...grid[row].length).cover?(col) && grid[row][col] == "1"
          grid[row][col] = "0"

          stack.push([row - 1, col])
          stack.push([row + 1, col])
          stack.push([row, col + 1])
          stack.push([row, col - 1])
        end
      end
    end
  end
end
