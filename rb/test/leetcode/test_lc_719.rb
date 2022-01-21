# frozen_string_literal: true

require("config")
require("leetcode/lc_719")

module LeetCode
  class TestLC719 < Minitest::Test
    include(LC719)

    [
      [[[1, 10], 1], 9],
      [[[1, 1, 1], 2], 0],
      [[[1, 3, 1], 1], 0],
      [[[1, 6, 1], 3], 5],
      [[[62, 200, 79, 4, 100], 3], 38],
      [[[24, 8, 84, 86, 67], 4], 19]
    ].each.with_index { |((nums, k), expected), i|
      define_method(:"test_smallest_distance_pair_#{i}") {
        assert_equal(expected, smallest_distance_pair(nums, k))
      }
    }
  end
end
