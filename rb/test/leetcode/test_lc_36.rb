# typed: false
# frozen_string_literal: true

require("config")
require("leetcode/lc_36")

module LeetCode
  class TestLC36 < Minitest::Test
    include(LC36)

    [
      [
        [
          %w[5 3 . . 7 . . . .],
          %w[6 . . 1 9 5 . . .],
          %w[. 9 8 . . . . 6 .],
          %w[8 . . . 6 . . . 3],
          %w[4 . . 8 . 3 . . 1],
          %w[7 . . . 2 . . . 6],
          %w[. 6 . . . . 2 8 .],
          %w[. . . 4 1 9 . . 5],
          %w[. . . . 8 . . 7 9]
        ],
        true
      ]
    ].each.with_index do |(board, expected), i|
      define_method(:"test_is_valid_sudoku_#{i}") do
        assert_equal(expected, valid_sudoku?(board))
      end
    end
  end
end
