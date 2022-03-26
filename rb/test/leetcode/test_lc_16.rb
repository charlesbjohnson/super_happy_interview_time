# frozen_string_literal: true

require("config")
require("leetcode/lc_16")

module LeetCode
  class TestLC16 < Minitest::Test
    include(LC16)

    [
      [[[0, 0, 0], 1], 0],
      [[[-1, 2, 1, -4], 1], 2]
    ].each.with_index { |((nums, target), expected), i|
      define_method(:"test_three_sum_closest_#{i}") {
        assert_equal(expected, three_sum_closest(nums, target))
      }
    }
  end
end
