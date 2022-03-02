# frozen_string_literal: true

require("config")
require("leetcode/lc_309")

module LeetCode
  class TestLC309 < Minitest::Test
    include(LC309)

    [
      [[1], 0],
      [[1, 2], 1],
      [[2, 1], 0],
      [[2, 4, 1, 3], 2],
      [[1, 3, 2, 4], 3],
      [[1, 2, 3, 0, 2], 3]
    ].each.with_index { |(prices, expected), i|
      define_method(:"test_max_profit_#{i}") {
        assert_equal(expected, max_profit(prices))
      }
    }
  end
end
