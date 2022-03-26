# frozen_string_literal: true

module LeetCode
  # 221. Maximal Square
  module LC221
    # Description:
    # Given an m x n binary matrix filled with 0's and 1's, find the largest square containing only 1's and return its area.
    #
    # Examples:
    # Input: matrix = [
    #   ["1", "0", "1", "0", "0"],
    #   ["1", "0", "1", "1", "1"],
    #   ["1", "1", "1", "1", "1"],
    #   ["1", "0", "0", "1", "0"]
    # ]
    # Output: 4
    #
    # Input: matrix = [
    #   ["0", "1"],
    #   ["1", "0"]
    # ]
    # Output: 1
    #
    # Input: matrix = [["0"]]
    # Output: 0
    #
    # @param {Array<Array<Character>>} matrix
    # @return {Integer}
    def maximal_square(matrix)
      result = private_methods.grep(/^maximal_square_\d+$/).map { |m| send(m, matrix) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def maximal_square_1(matrix)
      cache = {}
      max = 0

      rows = matrix.length
      cols = matrix[0].length

      rec = ->(r, c) {
        return 0 if r == rows || c == cols

        key = [r, c]
        return cache[key] if cache.key?(key)

        adj = [
          rec.call(r, c + 1),
          rec.call(r + 1, c + 1),
          rec.call(r + 1, c)
        ]

        cache[key] = matrix[r][c] == "1" ? 1 + adj.min : 0
        max = [max, cache[key]].max

        cache[key]
      }

      rec.call(0, 0)
      max**2
    end

    def maximal_square_2(matrix)
      rows = matrix.length
      cols = matrix[0].length

      cache = Array.new(rows + 1) { Array.new(cols + 1, 0) }
      max = 0

      (rows - 1).downto(0) { |r|
        (cols - 1).downto(0) { |c|
          if matrix[r][c] == "1"
            cache[r][c] = 1 + [
              cache[r][c + 1],
              cache[r + 1][c + 1],
              cache[r + 1][c]
            ].min

            max = [max, cache[r][c]].max
          end
        }
      }

      max**2
    end
  end
end
