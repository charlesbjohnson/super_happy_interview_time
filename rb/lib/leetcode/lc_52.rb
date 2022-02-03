# frozen_string_literal: true

module LeetCode
  # 52. N-Queens II
  module LC52
    # Description:
    # The n-queens puzzle is the problem of placing n queens on an n x n chessboard such that no two queens attack each other.
    # Given an integer n, return the number of distinct solutions to the n-queens puzzle.
    #
    # Examples:
    # Input: n = 4
    # Output: 2
    #
    # Input: n = 1
    # Output: 1
    #
    # @param {Integer} n
    # @return {Integer}
    def total_n_queens(n)
      r_total_queens(0, n, [])
    end

    private

    def r_total_queens(r, n, queens)
      if queens.length > 1
        defender = queens[-1]

        (0...(queens.length - 1)).each { |i|
          attacker = queens[i]

          return 0 if attacker[0] == defender[0] || attacker[1] == defender[1]
          return 0 if ((attacker[0] - defender[0]).fdiv(attacker[1] - defender[1]).abs - 1.0).abs < Float::EPSILON
        }
      end

      return 1 if r >= n

      (0...n).sum { |c|
        r_total_queens(r + 1, n, queens + [[r, c]])
      }
    end
  end
end
