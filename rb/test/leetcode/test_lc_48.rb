# typed: false
# frozen_string_literal: true

require "config"
require "leetcode/lc_48"

module LeetCode
  class TestLC48 < Minitest::Test
    include LC48

    [
      [[], []],
      [[0], [0]],
      [
        [
          [1, 2],
          [3, 4],
        ],
        [
          [3, 1],
          [4, 2],
        ],
      ],
      [
        [
          [1, 2, 3],
          [4, 5, 6],
          [7, 8, 9],
        ],
        [
          [7, 4, 1],
          [8, 5, 2],
          [9, 6, 3],
        ],
      ],
      [
        [
          [5, 1, 9, 11],
          [2, 4, 8, 10],
          [13, 3, 6, 7],
          [15, 14, 12, 16],
        ],
        [
          [15, 13, 2, 5],
          [14, 3, 4, 1],
          [12, 6, 8, 9],
          [16, 7, 10, 11],
        ],
      ],
    ].each.with_index do |(matrix, expected), i|
      define_method(:"test_rotate_#{i}") do
        rotate(matrix)
        assert_equal(expected, matrix)
      end
    end
  end
end
