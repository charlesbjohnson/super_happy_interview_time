# frozen_string_literal: true

require("config")
require("leetcode/lc_509")

module LeetCode
  class TestLC509 < Minitest::Test
    include(LC509)

    [
      [0, 0],
      [1, 1],
      [2, 1],
      [3, 2],
      [4, 3],
      [5, 5],
      [6, 8],
      [7, 13],
      [8, 21],
      [9, 34],
      [10, 55]
    ].each.with_index { |(n, expected), i|
      define_method(:"test_fib_#{i}") {
        assert_equal(expected, fib(n))
      }
    }
  end
end
