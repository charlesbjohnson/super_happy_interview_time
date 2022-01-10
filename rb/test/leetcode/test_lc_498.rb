# frozen_string_literal: true

require("config")
require("leetcode/lc_498")

module LeetCode
  class TestLC498 < Minitest::Test
    include(LC498)

    [
      [
        [
          [1, 2],
          [3, 4]
        ],
        [1, 2, 3, 4]
      ],
      [
        [
          [1, 2, 3],
          [4, 5, 6],
          [7, 8, 9]
        ],
        [1, 2, 4, 7, 5, 3, 6, 8, 9]
      ],
      [
        [
          [1, 2],
          [3, 4],
          [5, 6]
        ],
        [1, 2, 3, 5, 4, 6]
      ],
      [
        [
          [1, 2, 3],
          [4, 5, 6]
        ],
        [1, 2, 4, 5, 3, 6]
      ]
    ].each.with_index { |(mat, expected), i|
      define_method(:"test_find_diagonal_order_#{i}") {
        assert_equal(expected, find_diagonal_order(mat))
      }
    }
  end
end
