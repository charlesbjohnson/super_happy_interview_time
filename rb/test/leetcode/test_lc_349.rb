# frozen_string_literal: true

require("config")
require("leetcode/lc_349")

module LeetCode
  class TestLC349 < Minitest::Test
    include(LC349)

    [
      [[[], []], []],
      [[[1], []], []],
      [[[1, 2, 2, 1], [2, 2]], [2]],
      [[[4, 9, 5], [9, 4, 9, 8, 4]], [4, 9]]
    ].each.with_index { |((nums1, nums2), expected), i|
      define_method(:"test_intersection_#{i}") {
        assert_equal(expected, intersection(nums1, nums2))
      }
    }
  end
end
