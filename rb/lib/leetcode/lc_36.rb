# frozen_string_literal: true

module LeetCode
  # 36. Valid Sudoku
  module LC36
    # Description:
    # Determine if a 9 x 9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:
    # 1. Each row must contain the digits 1-9 without repetition.
    # 2. Each column must contain the digits 1-9 without repetition.
    # 3. Each of the nine 3 x 3 sub-boxes of the grid must contain the digits 1-9 without repetition.
    #
    # Note:
    # - A Sudoku board (partially filled) could be valid but is not necessarily solvable.
    # - Only the filled cells need to be validated according to the mentioned rules.
    #
    # Examples:
    # Input: board =
    #  [["5", "3", ".", ".", "7", ".", ".", ".", "."],
    #   ["6", ".", ".", "1", "9", "5", ".", ".", "."],
    #   [".", "9", "8", ".", ".", ".", ".", "6", "."],
    #   ["8", ".", ".", ".", "6", ".", ".", ".", "3"],
    #   ["4", ".", ".", "8", ".", "3", ".", ".", "1"],
    #   ["7", ".", ".", ".", "2", ".", ".", ".", "6"],
    #   [".", "6", ".", ".", ".", ".", "2", "8", "."],
    #   [".", ".", ".", "4", "1", "9", ".", ".", "5"],
    #   [".", ".", ".", ".", "8", ".", ".", "7", "9"]]
    # Output: true
    #
    #
    # Input: board =
    #  [["8", "3", ".", ".", "7", ".", ".", ".", "."],
    #   ["6", ".", ".", "1", "9", "5", ".", ".", "."],
    #   [".", "9", "8", ".", ".", ".", ".", "6", "."],
    #   ["8", ".", ".", ".", "6", ".", ".", ".", "3"],
    #   ["4", ".", ".", "8", ".", "3", ".", ".", "1"],
    #   ["7", ".", ".", ".", "2", ".", ".", ".", "6"],
    #   [".", "6", ".", ".", ".", ".", "2", "8", "."],
    #   [".", ".", ".", "4", "1", "9", ".", ".", "5"],
    #   [".", ".", ".", ".", "8", ".", ".", "7", "9"]]
    # Output: false
    #
    # @param {Array<Array<String>} board
    # @return {Boolean}
    def is_valid_sudoku(board)
      hash = Hash.new { |h, k| h[k] = Array.new(board.length, false) }
      dim = Math.sqrt(board.length).to_i

      (0...board.length).each { |i|
        (i...board.length).each { |r|
          c = i
          q = ((r / dim) * dim) + (c / dim)

          v = board[r][c]
          next if v == "."

          r_key = "r_#{r}"
          c_key = "c_#{c}"
          q_key = "q_#{q}"

          v = v.to_i - 1

          return false if hash[r_key][v] || hash[c_key][v] || hash[q_key][v]
          hash[r_key][v] = hash[c_key][v] = hash[q_key][v] = true
        }

        ((i + 1)...board[i].length).each { |c|
          r = i
          q = ((r / dim) * dim) + (c / dim)

          v = board[r][c]
          next if v == "."

          r_key = "r_#{r}"
          c_key = "c_#{c}"
          q_key = "q_#{q}"

          v = v.to_i - 1

          return false if hash[r_key][v] || hash[c_key][v] || hash[q_key][v]
          hash[r_key][v] = hash[c_key][v] = hash[q_key][v] = true
        }
      }

      true
    end
  end
end
