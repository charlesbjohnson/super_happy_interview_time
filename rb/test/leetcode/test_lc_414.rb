# frozen_string_literal: true

require("config")
require("leetcode/lc_414")

module LeetCode
  class TestLC414 < Minitest::Test
    include(LC414)

    [
      [[1], 1],
      [[1, 2], 2],
      [[3, 2, 1], 1],
      [[2, 2, 3, 1], 1],
      [[2, 2, 2, 2], 2]
    ].each.with_index { |(nums, expected), i|
      define_method(:"test_third_max_#{i}") {
        assert_equal(expected, third_max(nums))
      }
    }
  end
end
