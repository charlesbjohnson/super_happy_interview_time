# frozen_string_literal: true

require("config")
require("helpers/leetcode/heap")

require("leetcode/lc_215")

module LeetCode
  class TestLC215 < Minitest::Test
    include(LC215)

    [
      [[[0], 1], 0],
      [[[0, 1], 1], 1],
      [[[0, 1], 2], 0],
      [[[0, 1, 1], 2], 1],
      [[[0, 0, 1], 2], 0],
      [[[3, 2, 1, 5, 6, 4], 2], 5],
      [[[3, 2, 3, 1, 2, 4, 5, 5, 6], 4], 4]
    ].each.with_index { |((nums, k), expected), i|
      define_method(:"test_find_kth_largest_#{i}") {
        assert_equal(expected, find_kth_largest(nums, k))
      }
    }
  end
end
