# frozen_string_literal: true

require("config")
require("leetcode/lc_322")

module LeetCode
  class TestLC322 < Minitest::Test
    include(LC322)

    [
      [[], 0, 0],
      [[], 1, -1],
      [[0], 0, 0],
      [[1], 0, 0],
      [[0], 1, -1],
      [[1], 1, 1],
      [[1], 2, 2],
      [[1, 2], 2, 1],
      [[1, 2, 5], 5, 1],
      [[1, 2, 5], 11, 3],
      [[2], 3, -1],
      [[83, 186, 408, 419], 6249, 20]
    ].each.with_index { |(coins, amount, expected), i|
      define_method(:"test_coin_change_#{i}") {
        assert_equal(expected, coin_change(coins, amount))
      }
    }
  end
end
