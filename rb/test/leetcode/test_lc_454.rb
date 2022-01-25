# frozen_string_literal: true

require("config")
require("leetcode/lc_454")

module LeetCode
  class TestLC454 < Minitest::Test
    include(LC454)

    [
      [
        [
          [0],
          [0],
          [0],
          [0]
        ],
        1
      ],

      [
        [
          [1, 2],
          [-2, -1],
          [-1, 2],
          [0, 2]
        ],
        2
      ]
    ].each.with_index { |(nums, expected), i|
      define_method(:"test_four_sum_count_#{i}") {
        assert_equal(expected, four_sum_count(*nums))
      }
    }
  end
end
