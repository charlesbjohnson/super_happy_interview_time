# frozen_string_literal: true

module LeetCode
  # 240. Search a 2D Matrix II
  module LC240
    # Description:
    # Write an efficient algorithm that searches for a value in an m x n matrix.
    #
    # This matrix has the following properties:
    # - Integers in each row are sorted in ascending from left to right.
    # - Integers in each column are sorted in ascending from top to bottom.
    #
    # Examples:
    # - 1:
    #   Input: matrix = [
    #     [1,   4,  7, 11, 15],
    #     [2,   5,  8, 12, 19],
    #     [3,   6,  9, 16, 22],
    #     [10, 13, 14, 17, 24],
    #     [18, 21, 23, 26, 30]
    #   ],
    #   target = 5
    #   Output: true
    #
    # - 2:
    #   Input: matrix = [
    #     [1,   4,  7, 11, 15],
    #     [2,   5,  8, 12, 19],
    #     [3,   6,  9, 16, 22],
    #     [10, 13, 14, 17, 24],
    #     [18, 21, 23, 26, 30]
    #   ],
    #   target = 20
    #   Output: false
    #
    # @param matrix {Array<Array<Integer>>}
    # @param target {Integer}
    # @return {Boolean}
    def search_matrix(matrix, target)
      return false if matrix.empty?

      row = 0
      col = matrix[row].length - 1

      while (0...matrix.length).cover?(row) && (0...matrix[row].length).cover?(col)
        return true if target == matrix[row][col]

        if target > matrix[row][col]
          row += 1
        else
          col -= 1
        end
      end

      false
    end
  end
end
