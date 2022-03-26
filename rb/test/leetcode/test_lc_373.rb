# frozen_string_literal: true

require("config")
require("helpers/leetcode/heap")

require("leetcode/lc_373")

module LeetCode
  class TestLC373 < Minitest::Test
    include(LC373)

    [
      [
        [[1, 7, 11], [2, 4, 6], 3],
        [[1, 2], [1, 4], [1, 6]]
      ],

      [
        [[1, 1, 2], [1, 2, 3], 2],
        [[1, 1], [1, 1]]
      ],

      [
        [[1, 2], [3], 3],
        [[1, 3], [2, 3]]
      ]
    ].each.with_index { |((nums1, nums2, k), expected), i|
      define_method(:"test_k_smallest_pairs_#{i}") {
        assert_equal(expected, k_smallest_pairs(nums1, nums2, k))
      }
    }
  end
end
