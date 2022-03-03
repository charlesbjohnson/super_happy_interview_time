# frozen_string_literal: true

module LeetCode
  # 37. Sudoku Solver
  module LC37
    BitSet = Helpers::LeetCode::BitSet

    # Description:
    # Write a program to solve a Sudoku puzzle by filling the empty cells.
    #
    # A sudoku solution must satisfy all of the following rules:
    # - Each of the digits 1-9 must occur exactly once in each row.
    # - Each of the digits 1-9 must occur exactly once in each column.
    # - Each of the digits 1-9 must occur exactly once in each of the 9 3x3 sub-boxes of the grid.
    #
    # The '.' character indicates empty cells.
    #
    # Examples:
    # Input: board = [
    #   ["5", "3", ".", ".", "7", ".", ".", ".", "."],
    #   ["6", ".", ".", "1", "9", "5", ".", ".", "."],
    #   [".", "9", "8", ".", ".", ".", ".", "6", "."],
    #   ["8", ".", ".", ".", "6", ".", ".", ".", "3"],
    #   ["4", ".", ".", "8", ".", "3", ".", ".", "1"],
    #   ["7", ".", ".", ".", "2", ".", ".", ".", "6"],
    #   [".", "6", ".", ".", ".", ".", "2", "8", "."],
    #   [".", ".", ".", "4", "1", "9", ".", ".", "5"],
    #   [".", ".", ".", ".", "8", ".", ".", "7", "9"]
    # ]
    # Output: [
    #   ["5", "3", "4", "6", "7", "8", "9", "1", "2"],
    #   ["6", "7", "2", "1", "9", "5", "3", "4", "8"],
    #   ["1", "9", "8", "3", "4", "2", "5", "6", "7"],
    #   ["8", "5", "9", "7", "6", "1", "4", "2", "3"],
    #   ["4", "2", "6", "8", "5", "3", "7", "9", "1"],
    #   ["7", "1", "3", "9", "2", "4", "8", "5", "6"],
    #   ["9", "6", "1", "5", "3", "7", "2", "8", "4"],
    #   ["2", "8", "7", "4", "1", "9", "6", "3", "5"],
    #   ["3", "4", "5", "2", "8", "6", "1", "7", "9"]
    # ]
    #
    # @param {Array<Array<String>>} board
    # @return {nil}
    def solve_sudoku(board)
      rows = Array.new(board.length) { BitSet.new(0b11_1111_1110) }
      cols = Array.new(board.length) { BitSet.new(0b11_1111_1110) }
      secs = Array.new(board.length) { BitSet.new(0b11_1111_1110) }

      sqrt = Math.sqrt(board.length).to_i

      (0...board.length).each { |r|
        (0...board.length).each { |c|
          next if board[r][c] == "."

          s = (r / sqrt * sqrt) + (c / sqrt)
          v = board[r][c].to_i

          rows[r].delete(v)
          cols[c].delete(v)
          secs[s].delete(v)
        }
      }

      rec = ->(i) {
        return true if i >= board.length**2

        sqrt = Math.sqrt(board.length).to_i

        r = i / board.length
        c = i % board.length
        s = ((r / sqrt) * sqrt) + (c / sqrt)

        return rec.call(i + 1) if board[r][c] != "."

        candidates = rows[r] & cols[c] & secs[s]
        return false if candidates.empty?

        candidates.each { |candidate|
          board[r][c] = candidate.to_s

          rows[r].delete(candidate)
          cols[c].delete(candidate)
          secs[s].delete(candidate)

          if rec.call(i + 1)
            return true
          else
            board[r][c] = "."

            rows[r].add(candidate)
            cols[c].add(candidate)
            secs[s].add(candidate)
          end
        }

        false
      }

      rec.call(0)
      nil
    end
  end
end
