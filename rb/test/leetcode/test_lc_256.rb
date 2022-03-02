# frozen_string_literal: true

require("config")
require("leetcode/lc_256")

module LeetCode
  class TestLC256 < Minitest::Test
    include(LC256)

    [
      [[[7, 6, 2]], 2],
      [[[21, 16, 40], [24, 66, 82]], 40],
      [[[17, 2, 17], [16, 16, 5], [14, 3, 19]], 10]
    ].each.with_index { |(costs, expected), i|
      define_method(:"test_min_cost_#{i}") {
        assert_equal(expected, min_cost(costs))
      }
    }
  end
end
