# frozen_string_literal: true

require("config")
require("leetcode/lc_265")

module LeetCode
  class TestLC265 < Minitest::Test
    include(LC265)

    [
      [[[1, 2]], 1],
      [[[1, 3], [2, 4]], 5],
      [[[1, 5, 3], [2, 9, 4]], 5]
    ].each.with_index { |(costs, expected), i|
      define_method(:"test_min_cost_ii_#{i}") {
        assert_equal(expected, min_cost_ii(costs))
      }
    }
  end
end
