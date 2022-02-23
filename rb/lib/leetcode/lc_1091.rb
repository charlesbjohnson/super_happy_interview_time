# frozen_string_literal: true

module LeetCode
  # 1091. Shortest Path in Binary Matrix
  module LC1091
    # Description:
    # Given an n x n binary matrix grid, return the length of the shortest clear path in the matrix.
    # If there is no clear path, return -1.
    #
    # A clear path in a binary matrix is a path from the top-left cell (i.e., (0, 0)) to the bottom-right cell (i.e., (n - 1, n - 1)) such that:
    # - All the visited cells of the path are 0.
    # - All the adjacent cells of the path are 8-directionally connected (i.e., they are different and they share an edge or a corner).
    # - The length of a clear path is the number of visited cells of this path.
    #
    # Examples:
    # Input: grid = [[0, 1], [1, 0]]
    # Output: 2
    #
    # Input: grid = [[0, 0, 0], [1, 1, 0], [1, 1, 0]]
    # Output: 4
    #
    # Input: grid = [[1, 0, 0], [1, 1, 0], [1, 1, 0]]
    # Output: -1
    #
    # @param {Array<Array<Integer>>} grid
    # @return {Integer}
    def shortest_path_binary_matrix(grid)
      queue = [[0, 0, 1]]

      until queue.empty?
        r, c, i = queue.shift

        next if r < 0 || r >= grid.length
        next if c < 0 || c >= grid.length
        next if grid[r][c] == 1

        return i if r == grid.length - 1 && c == grid.length - 1

        queue.push([r - 1, c, i + 1]) # U
        queue.push([r - 1, c + 1, i + 1]) # UR
        queue.push([r, c + 1, i + 1]) # R
        queue.push([r + 1, c + 1, i + 1]) # DR
        queue.push([r + 1, c, i + 1]) # D
        queue.push([r + 1, c - 1, i + 1]) # DL
        queue.push([r, c - 1, i + 1]) # L
        queue.push([r - 1, c - 1, i + 1]) # UL

        grid[r][c] = 1
      end

      -1
    end
  end
end
