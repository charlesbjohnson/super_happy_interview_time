# frozen_string_literal: true

require("config")
require("leetcode/lc_931")

module LeetCode
  class TestLC931 < Minitest::Test
    include(LC931)

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
        1
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
          [2, 1, 3],
          [6, 5, 4],
          [7, 8, 9]
        ],
        13
      ],

      [
        [
          [-19, 57],
          [-40, -5]
        ],
        -59
      ]
    ].each.with_index { |(matrix, expected), i|
      define_method(:"test_min_falling_path_sum_#{i}") {
        assert_equal(expected, min_falling_path_sum(matrix))
      }
    }
  end
end
