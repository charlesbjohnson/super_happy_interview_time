# frozen_string_literal: true

require("config")
require("leetcode/lc_918")

module LeetCode
  class TestLC918 < Minitest::Test
    include(LC918)

    [
      [[1, -2, 3, -2], 3],
      [[5, -3, 5], 10],
      [[-3, -2, -3], -2]
    ].each.with_index { |(nums, expected), i|
      define_method(:"test_max_subarray_sum_circular_#{i}") {
        assert_equal(expected, max_subarray_sum_circular(nums))
      }
    }
  end
end
