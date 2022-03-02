# frozen_string_literal: true

require("config")
require("leetcode/lc_1137")

module LeetCode
  class TestLC1137 < Minitest::Test
    include(LC1137)

    [
      [0, 0],
      [1, 1],
      [2, 1],
      [3, 2],
      [4, 4],
      [25, 1389537]
    ].each.with_index { |(n, expected), i|
      define_method(:"test_tribonacci_#{i}") {
        assert_equal(expected, tribonacci(n))
      }
    }
  end
end
