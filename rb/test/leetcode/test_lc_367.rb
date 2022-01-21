# frozen_string_literal: true

require("config")
require("leetcode/lc_367")

module LeetCode
  class TestLC367 < Minitest::Test
    include(LC367)

    [
      [1, true],
      [2, false],
      [3, false],
      [4, true],
      [8, false],
      [9, true],
      [15, false],
      [16, true]
    ].each.with_index { |(num, expected), i|
      define_method(:"test_is_perfect_square_#{i}") {
        assert_equal(expected, is_perfect_square(num))
      }
    }
  end
end
