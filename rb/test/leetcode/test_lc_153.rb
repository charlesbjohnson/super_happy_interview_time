# frozen_string_literal: true

require("config")
require("leetcode/lc_153")

module LeetCode
  class TestLC153 < Minitest::Test
    include(LC153)

    [
      [[1], 1],
      [[1, 2, 3], 1],
      [[3, 1, 2], 1],
      [[2, 3, 1], 1],
      [[3, 4, 5, 1, 2], 1],
      [[4, 5, 6, 7, 0, 1, 2], 0],
      [[11, 13, 15, 17], 11]
    ].each.with_index { |(nums, expected), i|
      define_method(:"test_find_min_#{i}") {
        assert_equal(expected, find_min(nums))
      }
    }
  end
end
