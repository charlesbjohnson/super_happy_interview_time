# frozen_string_literal: true

require("config")
require("leetcode/lc_542")

module LeetCode
  class TestLC542 < Minitest::Test
    include(LC542)

    [
      [
        [
          [0, 0, 0],
          [0, 1, 0],
          [0, 0, 0]
        ],
        [
          [0, 0, 0],
          [0, 1, 0],
          [0, 0, 0]
        ]
      ],
      [
        [
          [0, 0, 0],
          [0, 1, 0],
          [1, 1, 1]
        ],
        [
          [0, 0, 0],
          [0, 1, 0],
          [1, 2, 1]
        ]
      ],
      [
        [
          [0, 1, 1],
          [1, 1, 1],
          [1, 1, 0]
        ],
        [
          [0, 1, 2],
          [1, 2, 1],
          [2, 1, 0]
        ]
      ]
    ].each.with_index { |(mat, expected), i|
      define_method(:"test_update_matrix_#{i}") {
        assert_equal(expected, update_matrix(mat))
      }
    }
  end
end
