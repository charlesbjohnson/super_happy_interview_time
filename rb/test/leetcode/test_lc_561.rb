# frozen_string_literal: true

require("config")
require("leetcode/lc_561")

module LeetCode
  class TestLC561 < Minitest::Test
    include(LC561)

    [
      [[10, 1], 1],
      [[1, 4, 3, 2], 4],
      [[6, 2, 6, 5, 1, 2], 9]
    ].each.with_index { |(nums, expected), i|
      define_method(:"test_array_pair_sum_#{i}") {
        assert_equal(expected, array_pair_sum(nums))
      }
    }
  end
end
