# frozen_string_literal: true

require("config")
require("leetcode/lc_69")

module LeetCode
  class TestLC69 < Minitest::Test
    include(LC69)

    [
      [0, 0],
      [3, 1],
      [4, 2],
      [8, 2],
      [9, 3],
      [15, 3],
      [16, 4],
      [24, 4],
      [25, 5],
      [100, 10]
    ].each.with_index { |(x, expected), i|
      define_method(:"test_my_sqrt_#{i}") {
        assert_equal(expected, my_sqrt(x))
      }
    }
  end
end
