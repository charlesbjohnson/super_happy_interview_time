# frozen_string_literal: true

module LeetCode
  # 498. Diagonal Traverse
  module LC498
    # Description:
    # Given an m x n matrix mat, return an array of all the elements of the array in a diagonal order.
    #
    #
    # Examples:
    # Input: mat = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    # Output: [1, 2, 4, 7, 5, 3, 6, 8, 9]
    #
    # Input: mat = [[1, 2], [3, 4]]
    # Output: [1, 2, 3, 4]
    #
    # @param {<Array<Array<Integer>>} mat
    # @return {Array<Integer>}
    def find_diagonal_order(mat)
      rows = mat.length
      cols = mat[0].length

      result = Array.new(rows * cols)
      i = 0

      r = 0
      c = 0

      r_dir = -1
      c_dir = 1

      while i < result.length
        result[i] = mat[r][c]

        r += r_dir
        c += c_dir

        if !(0...rows).cover?(r) || !(0...cols).cover?(c)
          # Top
          if r < 0 && (0...cols).cover?(c)
            r += 1
          # Bottom
          elsif r >= rows && (0...cols).cover?(c)
            r -= 1
            c += 2
          # Left
          elsif (0...rows).cover?(r) && c < 0
            c += 1
          # Right
          elsif (0...rows).cover?(r) && c >= cols
            r += 2
            c -= 1
          # Top-Right corner
          elsif r < 0 && c >= cols
            r += 2
            c -= 1
          # Bottom-Left corner
          elsif r >= rows && c < 0
            r -= 1
            c += 2
          end

          r_dir *= -1
          c_dir *= -1
        end

        i += 1
      end

      result
    end
  end
end
