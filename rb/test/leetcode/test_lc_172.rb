# typed: false
# frozen_string_literal: true

require("config")
require("leetcode/lc_172")

module LeetCode
  class TestLC172 < Minitest::Test
    include(LC172)

    [
      [0, 0],
      [4, 0],
      [5, 1],
      [9, 1],
      [10, 2],
      [15, 3],
      [20, 4],
      [100, 24]
    ].each.with_index { |(n, expected), i|
      define_method(:"test_trailing_zeroes_#{i}") {
        assert_equal(expected, trailing_zeroes(n))
      }
    }
  end
end
