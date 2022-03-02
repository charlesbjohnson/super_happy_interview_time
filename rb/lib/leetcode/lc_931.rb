# frozen_string_literal: true

module LeetCode
  # 931. Minimum Falling Path Sum
  module LC931
    # Description:
    # Given an n x n array of integers matrix, return the minimum sum of any falling path through matrix.
    #
    # A falling path starts at any element in the first row and chooses the element in the next row that is either directly below or diagonally left/right.
    # Specifically, the next element from position (row, col) will be (row + 1, col - 1), (row + 1, col), or (row + 1, col + 1).
    #
    # Examples:
    # Input: matrix = [[2, 1, 3], [6, 5, 4], [7, 8, 9]]
    # Output: 13
    #
    # Input: matrix = [[-19, 57], [-40, -5]]
    # Output: -59
    #
    # @param {Array<Array<Integer>>} matrix
    # @return {Integer}
    def min_falling_path_sum(matrix)
      m = matrix.length
      n = matrix[0].length

      result = Array.new(m) { |r| Array.new(n) { |c| matrix[r][c] } }

      (1...m).each { |r|
        (0...n).each { |c|
          result[r][c] += [
            c > 0 ? result[r - 1][c - 1] : Float::INFINITY,
            result[r - 1][c],
            c < n - 1 ? result[r - 1][c + 1] : Float::INFINITY
          ].min
        }
      }

      result[-1].min
    end
  end
end
