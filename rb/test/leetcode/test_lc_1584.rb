# frozen_string_literal: true

require("config")
require("helpers/leetcode/heap")

require("leetcode/lc_1584")

module LeetCode
  class TestLC1584 < Minitest::Test
    include(LC1584)

    [
      [[[0, 0], [2, 2], [3, 10], [5, 2], [7, 0]], 20],
      [[[3, 12], [-2, 5], [-4, 1]], 18]
    ].each.with_index { |(points, expected), i|
      define_method(:"test_min_cost_connect_points_#{i}") {
        assert_equal(expected, min_cost_connect_points(points))
      }
    }
  end
end
