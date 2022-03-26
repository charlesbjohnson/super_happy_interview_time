# frozen_string_literal: true

require("config")
require("leetcode/lc_213")

module LeetCode
  class TestLC213 < Minitest::Test
    include(LC213)

    [
      [[1], 1],
      [[2, 3, 2], 3],
      [[1, 2, 3, 1], 4],
      [[1, 2, 3], 3]
    ].each.with_index { |(nums, expected), i|
      define_method(:"test_rob_#{i}") {
        assert_equal(expected, rob(nums))
      }
    }
  end
end
