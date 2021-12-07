# frozen_string_literal: true

module LeetCode
  # 73. Set Matrix Zeroes
  module LC73
    # Description:
    # Given a m x n matrix, if an element is 0, set its entire row and column to 0. Do it in place.
    #
    # @param matrix {Array<Array<Integer>>}
    # @return {nil}
    def set_zeroes(matrix)
      zero_first_row = false
      zero_first_col = false

      (0...matrix.length).each { |row|
        (0...matrix[row].length).each { |col|
          next unless matrix[row][col].zero?

          zero_first_row = true if row.zero?
          zero_first_col = true if col.zero?

          if !row.zero? && !col.zero?
            matrix[row][0] = 0
            matrix[0][col] = 0
          end
        }
      }

      (0...matrix.length).reverse_each { |row|
        (0...matrix[row].length).reverse_each { |col|
          next unless (col.zero? && zero_first_col) ||
            (row.zero? && zero_first_row) ||
            (matrix[row][0].zero? || matrix[0][col].zero?)

          matrix[row][col] = 0
        }
      }

      nil
    end
  end
end
