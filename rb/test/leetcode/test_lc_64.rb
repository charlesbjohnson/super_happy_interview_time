# frozen_string_literal: true

require("config")
require("leetcode/lc_64")

module LeetCode
  class TestLC64 < Minitest::Test
    include(LC64)

    [
      [
        [
          [1]
        ],
        1
      ],

      [
        [
          [1, 2, 3]
        ],
        6
      ],

      [
        [
          [1],
          [2],
          [3]
        ],
        6
      ],

      [
        [
          [1, 2, 3],
          [4, 5, 6]
        ],
        12
      ],

      [
        [
          [0, 1, 2],
          [3, 4, 5],
          [6, 7, 8]
        ],
        16
      ],

      [
        [
          [1, 3, 1],
          [1, 5, 1],
          [4, 2, 1]
        ],
        7
      ]
    ].each.with_index { |(grid, expected), i|
      define_method(:"test_min_path_sum_#{i}") {
        assert_equal(expected, min_path_sum(grid))
      }
    }
  end
end
