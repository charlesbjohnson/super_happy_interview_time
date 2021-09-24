# typed: false
# frozen_string_literal: true

require("config")
require("leetcode/lc_122")

module LeetCode
  class TestLC122 < Minitest::Test
    include(LC122)

    [
      [[2, 1], 0],
      [[1, 2], 1],
      [[0, 1, 2], 2],
      [[0, 1, 0], 1],
      [[7, 1, 5, 3, 6, 4], 7],
      [[7, 6, 4, 3, 1], 0],
      [[3, 3, 5, 0, 0, 3, 1, 4], 8]
    ].each.with_index { |(prices, expected), i|
      define_method(:"test_max_profit_#{i}") {
        assert_equal(expected, max_profit(prices))
      }
    }
  end
end

# 0 1 2 2 4
