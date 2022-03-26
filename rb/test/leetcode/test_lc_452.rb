# frozen_string_literal: true

require("config")
require("leetcode/lc_452")

module LeetCode
  class TestLC452 < Minitest::Test
    include(LC452)

    [
      [[[10, 16], [2, 8], [1, 6], [7, 12]], 2],
      [[[1, 2], [3, 4], [5, 6], [7, 8]], 4],
      [[[1, 2], [2, 3], [3, 4], [4, 5]], 2]
    ].each.with_index { |(points, expected), i|
      define_method(:"test_find_min_arrow_shots_#{i}") {
        assert_equal(expected, find_min_arrow_shots(points))
      }
    }
  end
end
