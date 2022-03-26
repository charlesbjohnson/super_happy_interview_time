# frozen_string_literal: true

require("config")
require("leetcode/lc_417")

module LeetCode
  class TestLC417 < Minitest::Test
    include(LC417)

    [
      [
        [
          [1]
        ],
        [[0, 0]]
      ],

      [
        [
          [1, 2, 2, 3, 5],
          [3, 2, 3, 4, 4],
          [2, 4, 5, 3, 1],
          [6, 7, 1, 4, 5],
          [5, 1, 1, 2, 4]
        ],
        [[0, 4], [1, 3], [1, 4], [2, 2], [3, 0], [3, 1], [4, 0]]
      ],

      [
        [
          [2, 1],
          [1, 2]
        ],
        [[0, 0], [0, 1], [1, 0], [1, 1]]
      ]
    ].each.with_index { |(heights, expected), i|
      define_method(:"test_pacific_atlantic_#{i}") {
        assert_equal(expected.sort, pacific_atlantic(heights).sort)
      }
    }
  end
end
