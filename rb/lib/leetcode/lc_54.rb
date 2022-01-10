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
      rows = matrix.length
      cols = matrix[0].length

      result = Array.new(rows * cols)
      i = 0

      r = 0
      c = 0

      r_dir = 0
      c_dir = 1

      r_bound_top = 0
      r_bound_bottom = rows

      c_bound_left = -1
      c_bound_right = cols

      while i < result.length
        result[i] = matrix[r][c]

        # Right
        if c + 1 == c_bound_right && c_dir == 1
          c_dir = 0
          r_dir = 1
          c_bound_right -= 1
        # Down
        elsif r + 1 == r_bound_bottom && r_dir == 1
          c_dir = -1
          r_dir = 0
          r_bound_bottom -= 1
        # Left
        elsif c - 1 == c_bound_left && c_dir == -1
          c_dir = 0
          r_dir = -1
          c_bound_left += 1
        # Up
        elsif r - 1 == r_bound_top && r_dir == -1
          r_dir = 0
          c_dir = 1
          r_bound_top += 1
        end

        r += r_dir
        c += c_dir

        i += 1
      end

      result
    end
  end
end
