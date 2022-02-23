# frozen_string_literal: true

require("config")
require("helpers/leetcode/heap")

require("leetcode/lc_1631")

module LeetCode
  class TestLC1631 < Minitest::Test
    include(LC1631)

    [
      [[[1]], 0],
      [[[1, 2, 2], [3, 8, 2], [5, 3, 5]], 2],
      [[[1, 2, 3], [3, 8, 4], [5, 3, 5]], 1],
      [[[1, 2, 1, 1, 1], [1, 2, 1, 2, 1], [1, 2, 1, 2, 1], [1, 2, 1, 2, 1], [1, 1, 1, 2, 1]], 0],
      [[[3, 3, 7, 2, 9, 9, 3, 7, 10]], 7],
      [[[3], [3], [7], [2], [9], [9], [3], [7], [10]], 7]
    ].each.with_index { |(heights, expected), i|
      define_method(:"test_minimum_effort_path_#{i}") {
        assert_equal(expected, minimum_effort_path(heights))
      }
    }
  end
end
