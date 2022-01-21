# frozen_string_literal: true

require("config")
require("leetcode/lc_4")

module LeetCode
  class TestLC4 < Minitest::Test
    include(LC4)

    [
      [[[1], []], 1.0],
      [[[], [1]], 1.0],
      [[[1, 3], [2]], 2.0],
      [[[1, 2], [3, 4]], 2.5],
      [[[1, 2, 3], [1, 2, 3]], 2.0],
      [[[1], [2, 3, 4, 5, 6, 7]], 4.0],
      [[[5], [1, 2, 3, 4, 5, 6]], 4.0],
      [[[1, 1], [1, 2, 3, 4, 5, 6]], 2.5]
    ].each.with_index { |((nums1, nums2), expected), i|
      define_method(:"test_find_median_sorted_arrays_#{i}") {
        assert_equal(expected, find_median_sorted_arrays(nums1, nums2))
      }
    }
  end
end
