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
    #   ["1", "1", "1", "1", "0"],
    #   ["1", "1", "0", "1", "0"],
    #   ["1", "1", "0", "0", "0"],
    #   ["0", "0", "0", "0", "0"]
    # ]
    # Output: 1
    #
    # Input: grid = [
    #   ["1", "1", "0", "0", "0"],
    #   ["1", "1", "0", "0", "0"],
    #   ["0", "0", "1", "0", "0"],
    #   ["0", "0", "0", "1", "1"]
    # ]
    # Output: 3
    #
    # @param {Array<Array<String>>} grid
    # @return {Integer}
    def num_islands(grid)
      result = 0

      rows = grid.length
      cols = grid[0].length

      sink = ->(r, c) {
        return false if grid[r][c] == "0"

        queue = [[r, c]]

        until queue.empty?
          r, c = queue.shift

          next if grid[r][c] == "0"
          grid[r][c] = "0"

          queue.push([r - 1, c]) if r - 1 >= 0 && grid[r - 1][c] == "1"
          queue.push([r, c + 1]) if c + 1 < cols && grid[r][c + 1] == "1"
          queue.push([r + 1, c]) if r + 1 < rows && grid[r + 1][c] == "1"
          queue.push([r, c - 1]) if c - 1 >= 0 && grid[r][c - 1] == "1"
        end

        true
      }

      (0...rows).each { |r|
        (0...cols).each { |c|
          result += 1 if sink.call(r, c)
        }
      }

      result
    end
  end
end
