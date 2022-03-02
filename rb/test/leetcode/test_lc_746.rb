# frozen_string_literal: true

require("config")
require("leetcode/lc_746")

module LeetCode
  class TestLC746 < Minitest::Test
    include(LC746)

    [
      [[1, 2], 1],
      [[1, 2, 3], 2],
      [[10, 15, 20], 15],
      [[1, 100, 1, 1, 1, 100, 1, 1, 100, 1], 6]
    ].each.with_index { |(cost, expected), i|
      define_method(:"test_min_cost_climbing_stairs_#{i}") {
        assert_equal(expected, min_cost_climbing_stairs(cost))
      }
    }
  end
end
