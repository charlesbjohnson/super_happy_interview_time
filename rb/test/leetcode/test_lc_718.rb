# frozen_string_literal: true

require("config")
require("leetcode/lc_718")

module LeetCode
  class TestLC718 < Minitest::Test
    include(LC718)

    [
      [[[1], [0]], 0],
      [[[1], [1]], 1],
      [[[1], [1, 1]], 1],
      [[[1, 1], [1]], 1],
      [[[1, 2, 3, 2, 1], [3, 2, 1, 4, 7]], 3],
      [[[0, 0, 0, 0, 0], [0, 0, 0, 0, 0]], 5],
      [[[0, 0, 1, 0, 0], [0, 0, 0, 1, 0]], 4]
    ].each.with_index { |((nums1, nums2), expected), i|
      define_method(:"test_find_length_#{i}") {
        assert_equal(expected, find_length(nums1, nums2))
      }
    }
  end
end
