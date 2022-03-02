# frozen_string_literal: true

require("config")
require("leetcode/lc_221")

module LeetCode
  class TestLC221 < Minitest::Test
    include(LC221)

    [
      [[["0"]], 0],
      [[["1"]], 1],
      [
        [
          ["0", "1"],
          ["1", "0"]
        ],
        1
      ],
      [
        [
          ["1", "1"],
          ["1", "1"]
        ],
        4
      ],
      [
        [
          ["1", "0", "1", "0", "0"],
          ["1", "0", "1", "1", "1"],
          ["1", "1", "1", "1", "1"],
          ["1", "0", "0", "1", "0"]
        ],
        4
      ]
    ].each.with_index { |(matrix, expected), i|
      define_method(:"test_maximal_square_#{i}") {
        assert_equal(expected, maximal_square(matrix))
      }
    }
  end
end
