# frozen_string_literal: true

require("config")
require("leetcode/lc_1091")

module LeetCode
  class TestLC1091 < Minitest::Test
    include(LC1091)

    [
      [
        [
          [0, 1],
          [1, 0]
        ],
        2
      ],
      [
        [
          [0, 0, 0],
          [1, 1, 0],
          [1, 1, 0]
        ],
        4
      ],
      [
        [
          [1, 0, 0],
          [1, 1, 0],
          [1, 1, 0]
        ],
        -1
      ]
    ].each.with_index { |(grid, expected), i|
      define_method(:"test_shortest_path_binary_matrix_#{i}") {
        assert_equal(expected, shortest_path_binary_matrix(grid))
      }
    }
  end
end
