# frozen_string_literal: true

require("config")
require("leetcode/lc_200")

module LeetCode
  class TestLC200 < Minitest::Test
    include(LC200)

    [
      [
        [
          %w[0]
        ],
        0
      ],

      [
        [
          %w[1]
        ],
        1
      ],

      [
        [
          %w[1 1 1],
          %w[1 1 1],
          %w[1 1 1]
        ],
        1
      ],

      [
        [
          %w[1 1 1],
          %w[0 0 0],
          %w[1 1 1]
        ],
        2
      ],

      [
        [
          %w[1 0 1],
          %w[1 0 1],
          %w[1 0 1]
        ],
        2
      ],

      [
        [
          %w[1 0 1],
          %w[0 0 0],
          %w[1 0 1]
        ],
        4
      ],

      [
        [
          %w[1 1 1 1 0],
          %w[1 1 0 1 0],
          %w[1 1 0 0 0],
          %w[0 0 0 0 0]
        ],
        1
      ],

      [
        [
          %w[1 1 0 0 0],
          %w[1 1 0 0 0],
          %w[0 0 1 0 0],
          %w[0 0 0 1 1]
        ],
        3
      ]
    ].each.with_index { |(grid, expected), i|
      define_method(:"test_num_islands_#{i}") {
        assert_equal(expected, num_islands(grid))
      }
    }
  end
end
