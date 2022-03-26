# frozen_string_literal: true

module LeetCode
  # 73. Set Matrix Zeroes
  module LC73
    # Description:
    # Given an m x n integer matrix matrix, if an element is 0, set its entire row and column to 0's.
    # You must do it in place.
    #
    # Follow up:
    # - A straightforward solution using O(mn) space is probably a bad idea.
    # - A simple improvement uses O(m + n) space, but still not the best solution.
    # - Could you devise a constant space solution?
    #
    # Input: matrix = [[1, 1, 1], [1, 0, 1], [1, 1, 1]]
    # Output: [[1, 0, 1], [0, 0, 0], [1, 0, 1]]
    #
    # Input: matrix = [[0, 1, 2, 0], [3, 4, 5, 2], [1, 3, 1, 5]]
    # Output: [[0, 0, 0, 0], [0, 4, 5, 0], [0, 3, 1, 0]]
    #
    # @param matrix {Array<Array<Integer>>}
    # @return {nil}
    def set_zeroes(matrix)
      result = private_methods.grep(/^set_zeroes_\d+$/).map { |m|
        Marshal.load(Marshal.dump(matrix)).tap { |mtx| send(m, mtx) }
      }.uniq

      result.length == 1 ? set_zeroes_2(matrix) : raise
    end

    private

    def set_zeroes_1(matrix)
      rows = matrix.length
      cols = matrix[0].length

      r_0 = Set.new
      c_0 = Set.new

      (0...rows).each { |r|
        (0...cols).each { |c|
          if matrix[r][c] == 0
            r_0.add(r)
            c_0.add(c)
          end
        }
      }

      (rows - 1).downto(0) { |r|
        (cols - 1).downto(0) { |c|
          matrix[r][c] = 0 if r_0.include?(r) || c_0.include?(c)
        }
      }

      nil
    end

    def set_zeroes_2(matrix)
      rows = matrix.length
      cols = matrix[0].length

      r_0 = false
      c_0 = false

      (0...rows).each { |r|
        (0...cols).each { |c|
          if matrix[r][c] == 0
            if r == 0 || c == 0
              r_0 = true if r == 0
              c_0 = true if c == 0
            else
              matrix[r][0] = 0
              matrix[0][c] = 0
            end
          end
        }
      }

      (rows - 1).downto(0) { |r|
        (cols - 1).downto(0) { |c|
          matrix[r][c] = 0 if (r == 0 && r_0) || (c == 0 && c_0) || matrix[r][0] == 0 || matrix[0][c] == 0
        }
      }

      nil
    end
  end
end
