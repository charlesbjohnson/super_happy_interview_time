# frozen_string_literal: true

module LeetCode
  # 542. 01 Matrix
  module LC542
    # Description:
    # Given an m x n binary matrix mat, return the distance of the nearest 0 for each cell.
    #
    # The distance between two adjacent cells is 1.
    #
    # Examples:
    # Input: mat = [[0, 0, 0], [0, 1, 0], [0, 0, 0]]
    # Output: [[0, 0, 0], [0, 1, 0], [0, 0, 0]]
    #
    # Input: mat = [[0, 0, 0], [0, 1, 0], [1, 1, 1]]
    # Output: [[0, 0, 0], [0, 1, 0], [1, 2, 1]]
    #
    # @param {Array<Array<Integer>} mat
    # @return {Array<Array<Integer>>}
    def update_matrix(mat)
      queue = []

      result = Array.new(mat.length) { |r|
        Array.new(mat[r].length) { |c|
          if mat[r][c] == 0
            queue.push([r, c])
            0
          end
        }
      }

      until queue.empty?
        r, c = queue.shift

        if (0...(result.length)).cover?(r - 1) && !result[r - 1][c]
          result[r - 1][c] = result[r][c] + 1
          queue.push([r - 1, c])
        end

        if (0...(result.length)).cover?(r + 1) && !result[r + 1][c]
          result[r + 1][c] = result[r][c] + 1
          queue.push([r + 1, c])
        end

        if (0...(result[r].length)).cover?(c - 1) && !result[r][c - 1]
          result[r][c - 1] = result[r][c] + 1
          queue.push([r, c - 1])
        end

        if (0...(result[r].length)).cover?(c + 1) && !result[r][c + 1]
          result[r][c + 1] = result[r][c] + 1
          queue.push([r, c + 1])
        end
      end

      result
    end
  end
end
