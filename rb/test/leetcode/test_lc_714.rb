# frozen_string_literal: true

require("config")
require("leetcode/lc_714")

module LeetCode
  class TestLC714 < Minitest::Test
    include(LC714)

    [
      [[[1], 1], 0],
      [[[1, 2], 0], 1],
      [[[1, 2], 1], 0],
      [[[1, 3, 2, 8, 4, 9], 2], 8],
      [[[1, 3, 7, 5, 10, 3], 3], 6]
    ].each.with_index { |((prices, fee), expected), i|
      define_method(:"test_max_profit_#{i}") {
        assert_equal(expected, max_profit(prices, fee))
      }
    }
  end
end
