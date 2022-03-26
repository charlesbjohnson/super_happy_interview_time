# frozen_string_literal: true

require("config")
require("leetcode/lc_57")

module LeetCode
  class TestLC57 < Minitest::Test
    include(LC57)

    [
      [
        [[], [2, 3]],
        [[2, 3]]
      ],

      [
        [[[1, 2]], [3, 4]],
        [[1, 2], [3, 4]]
      ],

      [
        [[[3, 4]], [1, 2]],
        [[1, 2], [3, 4]]
      ],

      [
        [[[1, 2]], [2, 3]],
        [[1, 3]]
      ],

      [
        [[[1, 3], [6, 9]], [2, 5]],
        [[1, 5], [6, 9]]
      ],

      [
        [[[1, 2], [3, 5], [6, 7], [8, 10], [12, 16]], [4, 8]],
        [[1, 2], [3, 10], [12, 16]]
      ]
    ].each.with_index { |((intervals, new_interval), expected), i|
      define_method(:"test_insert_#{i}") {
        assert_equal(expected, insert(intervals, new_interval))
      }
    }
  end
end
