# frozen_string_literal: true

module LeetCode
  # 994. Rotting Oranges
  module LC994
    # Description:
    # You are given an m x n grid where each cell can have one of three values:
    #
    # - 0 representing an empty cell,
    # - 1 representing a fresh orange, or
    # - 2 representing a rotten orange.
    #
    # Every minute, any fresh orange that is 4-directionally adjacent to a rotten orange becomes rotten.
    #
    # Return the minimum number of minutes that must elapse until no cell has a fresh orange. If this is impossible, return -1.
    #
    # Examples:
    # Input: grid = [[2, 1, 1], [1, 1, 0], [0, 1, 1]]
    # Output: 4
    #
    # Input: grid = [[2, 1, 1], [0, 1, 1], [1, 0, 1]]
    # Output: -1
    #
    # Input: grid = [[0, 2]]
    # Output: 0
    #
    # @param {Array<Array<Integer>>} grid
    # @return {Integer}
    def oranges_rotting(grid)
      result = -1

      queue = [[]]
      fresh = 0

      (0...grid.length).each { |r|
        (0...grid[r].length).each { |c|
          case grid[r][c]
          when 1
            fresh += 1
          when 2
            queue[0].push([r, c])
          end
        }
      }

      until queue.empty?
        rotten = queue.shift
        rotting = []

        rotten.each { |r, c|
          # up
          if r - 1 >= 0 && grid[r - 1][c] == 1
            rotting.push([r - 1, c])
            grid[r - 1][c] = 2
            fresh -= 1
          end

          # down
          if r + 1 < grid.length && grid[r + 1][c] == 1
            rotting.push([r + 1, c])
            grid[r + 1][c] = 2
            fresh -= 1
          end

          # left
          if c - 1 >= 0 && grid[r][c - 1] == 1
            rotting.push([r, c - 1])
            grid[r][c - 1] = 2
            fresh -= 1
          end

          # right
          if c + 1 < grid[r].length && grid[r][c + 1] == 1
            rotting.push([r, c + 1])
            grid[r][c + 1] = 2
            fresh -= 1
          end
        }

        queue.push(rotting) if !rotting.empty?
        result += 1
      end

      fresh == 0 ? result : -1
    end
  end
end
