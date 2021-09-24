# typed: false
# frozen_string_literal: true

require("config")
require("leetcode/lc_121")

module LeetCode
  class TestLC121 < Minitest::Test
    include(LC121)

    [
      [[2, 1], 0],
      [[1, 2], 1],
      [[0, 1, 2], 2],
      [[9, 1, 2], 1],
      [[1, 3, 0, 1], 2],
      [[9, 8, 7, 6], 0],
      [[7, 1, 5, 3, 6, 4], 5],
      [[7, 6, 4, 3, 1], 0],
      [[3, 3, 5, 0, 0, 3, 1, 4], 4]
    ].each.with_index do |(prices, expected), i|
      define_method(:"test_max_profit_#{i}") do
        assert_equal(expected, max_profit(prices))
      end
    end
  end
end
