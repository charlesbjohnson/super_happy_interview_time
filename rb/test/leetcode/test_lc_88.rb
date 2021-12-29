# frozen_string_literal: true

require("config")
require("leetcode/lc_88")

module LeetCode
  class TestLC88 < Minitest::Test
    include(LC88)

    [
      [[], [], []],
      [[0], [], [0]],
      [[nil], [0], [0]],
      [[1, nil], [2], [1, 2]],
      [[2, nil], [1], [1, 2]],
      [[1, 3, nil], [2], [1, 2, 3]],
      [[2, nil, nil], [1, 3], [1, 2, 3]],
      [[1, 2, 3, nil, nil], [-1, 0], [-1, 0, 1, 2, 3]],
      [[-1, 0, nil, nil, nil], [1, 2, 3], [-1, 0, 1, 2, 3]]
    ].each.with_index { |(nums1, nums2, expected), i|
      define_method(:"test_merge_#{i}") {
        merge(nums1, nums1.count { !_1.nil? }, nums2, nums2.length)
        assert_equal(expected, nums1)
      }
    }
  end
end
