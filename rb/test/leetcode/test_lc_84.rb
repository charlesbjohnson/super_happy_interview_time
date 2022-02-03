# frozen_string_literal: true

require("config")
require("leetcode/lc_84")

module LeetCode
  class TestLC84 < Minitest::Test
    include(LC84)

    [
      [[1], 1],
      [[2, 3], 4],
      [[3, 2], 4],
      [[2, 5], 5],
      [[5, 2], 5],
      [[3, 3, 3], 9],
      [[3, 8, 3], 9],
      [[2, 1, 5, 6, 2, 3], 10]
    ].each.with_index { |(heights, expected), i|
      define_method(:"test_largest_rectangle_area_#{i}") {
        assert_equal(expected, largest_rectangle_area(heights))
      }
    }
  end
end
