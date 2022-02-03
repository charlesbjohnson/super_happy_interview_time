# frozen_string_literal: true

require("config")
require("helpers/leetcode/heap")

require("leetcode/lc_218")

module LeetCode
  class TestLC218 < Minitest::Test
    include(LC218)

    [
      [[[0, 2, 3], [2, 5, 3]], [[0, 3], [5, 0]]],
      [[[2, 9, 10], [3, 7, 15], [5, 12, 12], [15, 20, 10], [19, 24, 8]], [[2, 10], [3, 15], [7, 12], [12, 0], [15, 10], [20, 8], [24, 0]]]
    ].each.with_index { |(buildings, expected), i|
      define_method(:"test_get_skyline_#{i}") {
        assert_equal(expected, get_skyline(buildings))
      }
    }
  end
end
