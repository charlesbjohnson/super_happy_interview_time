# typed: true
# frozen_string_literal: true

module LeetCode
  # 74. Search a 2D Matrix
  module LC74
    def search_rows(matrix, target)
      return if matrix.empty?

      low = 0
      high = matrix.length - 1

      while low <= high
        mid = low + ((high - low) / 2)

        return if matrix[mid].empty?
        return mid if target >= matrix[mid][0] && target <= matrix[mid][matrix[mid].length - 1]

        if target < matrix[mid][0]
          high = mid - 1
          next
        end

        if target > matrix[mid][matrix[mid].length - 1]
          low = mid + 1
          next
        end
      end

      nil
    end

    def search_columns(matrix, row, target)
      low = 0
      high = matrix[row].length - 1

      while low <= high
        mid = low + ((high - low) / 2)

        return mid if matrix[row][mid] == target

        if target < matrix[row][mid]
          high = mid - 1
        else
          low = mid + 1
        end
      end

      nil
    end

    # Description:
    # Write an efficient algorithm that searches for a value in an m x n matrix.
    #
    # This matrix has the following properties:
    # - Integers in each row are sorted from left to right.
    # - The first integer of each row is greater than the last integer of the previous row.
    #
    # Examples:
    # Input:
    #   matrix = [
    #     [ 1,  3,  5,  7],
    #     [10, 11, 16, 20],
    #     [23, 30, 34, 50]
    #   ],
    #   target = 3
    # Output: true
    #
    # @param matrix {Array<Array<Integer>>}
    # @param target {Integer}
    # @return {Boolean}
    def search_matrix(matrix, target)
      row = search_rows(matrix, target)
      !row.nil? && !search_columns(matrix, row, target).nil?
    end
  end
end
