# frozen_string_literal: true

module LeetCode
  # 48. Rotate Image
  module LC48
    def transpose(matrix)
      (0...matrix.length).each { |row|
        (row...matrix[row].length).each { |col|
          matrix[row][col], matrix[col][row] = matrix[col][row], matrix[row][col]
        }
      }

      matrix
    end

    def flip_horizontal(matrix)
      (0...matrix.length).each { |row|
        (0...(matrix[row].length / 2)).each { |col|
          offset = (matrix[row].length - 1 - col)
          matrix[row][col], matrix[row][offset] = matrix[row][offset], matrix[row][col]
        }
      }

      matrix
    end

    # Description:
    # You are given an n x n 2D matrix representing an image.
    # Rotate the image by 90 degrees (clockwise).
    #
    # Examples:
    # - 1:
    #   Input: matrix = [
    #     [1, 2, 3],
    #     [4, 5, 6],
    #     [7, 8, 9],
    #   ]
    #   Output: nil
    #   where matrix = [
    #     [7, 4, 1],
    #     [8, 5, 2],
    #     [9, 6, 3],
    #   ]
    #
    # - 2:
    #   Input: matrix = [
    #     [ 5,  1,  9, 11],
    #     [ 2,  4,  8, 10],
    #     [13,  3,  6,  7],
    #     [15, 14, 12, 16]
    #   ]
    #   Output: nil
    #   where matrix = [
    #     [15, 13,  2,  5],
    #     [14,  3,  4,  1],
    #     [12,  6,  8,  9],
    #     [16,  7, 10, 11]
    #   ]
    #
    # Notes:
    # - You have to rotate the image in-place, which means you have to modify the input 2D matrix directly.
    # - Do not allocate another 2D matrix and do the rotation.
    #
    # @param matrix {Array<Array<Integer>>}
    # @return {nil}
    def rotate(matrix)
      flip_horizontal(transpose(matrix)) if matrix.length > 1
      nil
    end
  end
end
