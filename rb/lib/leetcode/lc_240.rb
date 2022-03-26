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
    # Input: matrix = [
    #   [1,   4,  7, 11, 15],
    #   [2,   5,  8, 12, 19],
    #   [3,   6,  9, 16, 22],
    #   [10, 13, 14, 17, 24],
    #   [18, 21, 23, 26, 30]
    # ],
    # target = 5
    # Output: true
    #
    # Input: matrix = [
    #   [1,   4,  7, 11, 15],
    #   [2,   5,  8, 12, 19],
    #   [3,   6,  9, 16, 22],
    #   [10, 13, 14, 17, 24],
    #   [18, 21, 23, 26, 30]
    # ],
    # target = 20
    # Output: false
    #
    # @param matrix {Array<Array<Integer>>}
    # @param target {Integer}
    # @return {Boolean}
    def search_matrix(matrix, target)
      result = private_methods.grep(/^search_matrix_\d+$/).map { |m| send(m, matrix, target) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def search_matrix_1(matrix, target)
      search = ->(lo, hi) {
        return false if lo[0] > hi[0] || lo[1] > hi[1]
        return false if target < matrix[lo[0]][lo[1]] || target > matrix[hi[0]][hi[1]]

        mid = [
          ((hi[0] - lo[0]) / 2) + lo[0],
          ((hi[1] - lo[1]) / 2) + lo[1]
        ]

        case target <=> matrix[mid[0]][mid[1]]
        when 0
          return true
        when -1
          search.call(lo, [mid[0] - 1, mid[1] - 1]) \
          || search.call([mid[0], lo[1]], [hi[0], mid[1] - 1]) \
          || search.call([lo[0], mid[1]], [mid[0] - 1, hi[1]])
        when 1
          search.call([mid[0] + 1, mid[1] + 1], hi) \
          || search.call([mid[0] + 1, lo[1]], [hi[0], mid[1]]) \
          || search.call([lo[0], mid[1] + 1], [mid[0], hi[1]])
        end
      }

      search.call([0, 0], [matrix.length - 1, matrix[0].length - 1])
    end

    def search_matrix_2(matrix, target)
      rows = matrix.length
      cols = matrix[0].length

      row = 0
      col = cols - 1

      while row >= 0 && row < rows && col >= 0 && col < cols
        case target <=> matrix[row][col]
        when 0
          return true
        when -1
          col -= 1
        when 1
          row += 1
        end
      end

      false
    end
  end
end
