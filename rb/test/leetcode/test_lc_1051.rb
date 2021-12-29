# frozen_string_literal: true

require("config")
require("leetcode/lc_1051")

module LeetCode
  class TestLC1051 < Minitest::Test
    include(LC1051)

    [
      [[], 0],
      [[1], 0],
      [[2, 1], 2],
      [[1, 1, 4, 2, 1, 3], 3],
      [[5, 1, 2, 3, 4], 5],
      [[1, 2, 3, 4, 5], 0]
    ].each.with_index { |(heights, expected), i|
      define_method(:"test_height_checker_#{i}") {
        assert_equal(expected, height_checker(heights))
      }
    }
  end
end
