# frozen_string_literal: true

require("config")
require("leetcode/lc_54")

module LeetCode
  class TestLC54 < Minitest::Test
    include(LC54)

    [
      [
        [
          [1]
        ],
        [1]
      ],
      [
        [
          [1, 2, 3]
        ],
        [1, 2, 3]
      ],
      [
        [
          [1],
          [2],
          [3]
        ],
        [1, 2, 3]
      ],
      [
        [
          [1, 2, 3],
          [4, 5, 6],
          [7, 8, 9]
        ],
        [1, 2, 3, 6, 9, 8, 7, 4, 5]
      ],
      [
        [
          [1, 2, 3, 4],
          [5, 6, 7, 8],
          [9, 10, 11, 12]
        ],
        [1, 2, 3, 4, 8, 12, 11, 10, 9, 5, 6, 7]
      ]
    ].each.with_index { |(matrix, expected), i|
      define_method(:"test_spiral_order_#{i}") {
        assert_equal(expected, spiral_order(matrix))
      }
    }
  end
end
