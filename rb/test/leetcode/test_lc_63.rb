# frozen_string_literal: true

require("config")
require("leetcode/lc_63")

module LeetCode
  class TestLC63 < Minitest::Test
    include(LC63)

    [
      [
        [
          [0]
        ],
        1
      ],
      [
        [
          [1]
        ],
        0
      ],
      [
        [
          [0, 1],
          [0, 0]
        ],
        1
      ],
      [
        [
          [0, 0, 0],
          [0, 1, 0],
          [0, 0, 0]
        ],
        2
      ]
    ].each.with_index { |(obstacle_grid, expected), i|
      define_method(:"test_unique_paths_with_obstacles_#{i}") {
        assert_equal(expected, unique_paths_with_obstacles(obstacle_grid))
      }
    }
  end
end
