# frozen_string_literal: true

module LeetCode
  # 54. Spiral Matrix
  module LC54
    # Description:
    # Given an m x n matrix, return all elements of the matrix in spiral order.
    #
    # Examples:
    # Input: matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    # Output: [1, 2, 3, 6, 9, 8, 7, 4, 5]
    #
    # Input: matrix = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]]
    # Output: [1, 2, 3, 4, 8, 12, 11, 10, 9, 5, 6, 7]
    #
    # @param {Array<Array<Integer>>} matrix
    # @return {Array<Integer>}
    def spiral_order(matrix)
      result = []

      rows = matrix.length
      cols = matrix[0].length

      r = 0
      c = 0

      dir = [0, 1]

      r_bound = [-1, rows]
      c_bound = [-1, cols]

      while result.length < rows * cols
        result.push(matrix[r][c])

        # Right
        if dir == [0, 1] && c + 1 == c_bound[1]
          dir = [1, 0]
          r_bound[0] += 1
        # Down
        elsif dir == [1, 0] && r + 1 == r_bound[1]
          dir = [0, -1]
          c_bound[1] -= 1
        # Left
        elsif dir == [0, -1] && c - 1 == c_bound[0]
          dir = [-1, 0]
          r_bound[1] -= 1
        # Up
        elsif dir == [-1, 0] && r - 1 == r_bound[0]
          dir = [0, 1]
          c_bound[0] += 1
        end

        r += dir[0]
        c += dir[1]
      end

      result
    end
  end
end
