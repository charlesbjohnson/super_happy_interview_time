# frozen_string_literal: true

module LeetCode
  # 74. Search a 2D Matrix
  module LC74
    # Description:
    # Write an efficient algorithm that searches for a value target in an m x n integer matrix matrix.
    #
    # This matrix has the following properties:
    # - Integers in each row are sorted from left to right.
    # - The first integer of each row is greater than the last integer of the previous row.
    #
    # Examples:
    # Input: matrix = [
    #   [1, 3, 5, 7],
    #   [10, 11, 16, 20],
    #   [23, 30, 34, 60]
    # ], target = 3
    # Output: true
    #
    # Input: matrix = [
    #   [1, 3, 5, 7],
    #   [10, 11, 16, 20],
    #   [23, 30, 34, 60]
    # ], target = 13
    # Output: false
    #
    # @param {Array<Array<Integer>>} matrix
    # @param {Integer} target
    # @return {Boolean}
    def search_matrix(matrix, target)
      rows = matrix.length
      cols = matrix[0].length

      lo = 0
      hi = rows - 1

      row = nil

      while lo <= hi
        mid = ((hi - lo) / 2) + lo

        if target < matrix[mid][0]
          hi = mid - 1
        elsif target > matrix[mid][-1]
          lo = mid + 1
        else
          row = mid
          break
        end
      end

      return false if !row

      lo = 0
      hi = cols - 1

      while lo <= hi
        mid = ((hi - lo) / 2) + lo

        case target <=> matrix[row][mid]
        when 0
          return true
        when -1
          hi = mid - 1
        when 1
          lo = mid + 1
        end
      end

      false
    end
  end
end
