# typed: false
# frozen_string_literal: true

require("config")
require("leetcode/lc_198")

module LeetCode
  class TestLC198 < Minitest::Test
    include(LC198)

    [
      [[], 0],
      [[1], 1],
      [[1, 2], 2],
      [[2, 1], 2],
      [[1, 3, 2], 3],
      [[1, 2, 3, 4, 5], 9]
    ].each.with_index { |(list, expected), i|
      define_method(:"test_rob_#{i}") {
        assert_equal(expected, rob(list))
      }
    }
  end
end
