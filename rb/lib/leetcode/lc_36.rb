# typed: false
# frozen_string_literal: true

require("set")

module LeetCode
  # 36. Valid Sudoku
  module LC36
    def valid_row?(board, row)
      !((0...board[row].length).each.with_object(Set.new) { |col, set|
        next set if board[row][col] == "."
        return false unless set.add?(board[row][col])
      }).nil?
    end

    def valid_column?(board, col)
      !((0...board.length).each.with_object(Set.new) { |row, set|
        next set if board[row][col] == "."
        return false unless set.add?(board[row][col])
      }).nil?
    end

    def valid_region?(board, start_row, start_col, size)
      !((start_row...(start_row + size)).each.with_object(Set.new) { |row, set|
        (start_col...(start_col + size)).each { |col|
          next if board[row][col] == "."
          return false unless set.add?(board[row][col])
        }
      }).nil?
    end

    # Description:
    # Determine if a Sudoku is valid, according to: [Sudoku Puzzles - The Rules](http://sudoku.com.au/TheRules.aspx).
    # The Sudoku board could be partially filled, where empty cells are filled with the character '.'.
    #
    # Examples:
    #   5 3 . | . 7 . | . . .
    #   6 . . | 1 9 5 | . . .
    #   . 9 8 | . . . | . 6 .
    #   ---------------------
    #   8 . . | . 6 . | . . 3
    #   4 . . | 8 . 3 | . . 1
    #   7 . . | . 2 . | . . 6
    #   ---------------------
    #   . 6 . | . . . | 2 8 .
    #   . . . | 4 1 9 | . . 5
    #   . . . | . 8 . | . 7 9
    #
    # Notes:
    # - A valid Sudoku board (partially filled) is not necessarily solvable. Only the filled cells need to be validated.

    # @param {Array<Array<String>>}
    # @return {Boolean}
    def valid_sudoku?(board)
      (0...board.length).each { |row|
        return false unless valid_row?(board, row)
      }

      (0...board[0].length).each { |col|
        return false unless valid_column?(board, col)
      }

      regions = (0...board.length).step(3).to_a
      regions.product(regions).each { |(row, col)|
        return false unless valid_region?(board, row, col, 3)
      }

      true
    end

    alias is_valid_sudoku valid_sudoku?
  end
end
