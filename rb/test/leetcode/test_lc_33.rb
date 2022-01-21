# frozen_string_literal: true

require("config")
require("leetcode/lc_33")

module LeetCode
  class TestLC33 < Minitest::Test
    include(LC33)

    [
      [[[0], 0], 0],
      [[[0], 1], -1],
      [[[0, 1, 2], 0], 0],
      [[[0, 1, 2], 1], 1],
      [[[0, 1, 2], 2], 2],
      [[[2, 0, 1], 0], 1],
      [[[2, 0, 1], 1], 2],
      [[[2, 0, 1], 2], 0],
      [[[1, 2, 0], 0], 2],
      [[[1, 2, 0], 1], 0],
      [[[1, 2, 0], 2], 1],
      [[[1, 2, 0], -1], -1],
      [[[5, 1, 2, 3, 4], 5], 0],
      [[[4, 5, 1, 2, 3], 5], 1],
      [[[3, 4, 5, 1, 2], 5], 2],
      [[[2, 3, 4, 5, 1], 5], 3],
      [[[1, 2, 3, 4, 5], 5], 4],
      [[[4, 5, 6, 7, 0, 1, 2], 0], 4],
      [[[4, 5, 6, 7, 0, 1, 2], 3], -1]
    ].each.with_index { |((nums, target), expected), i|
      define_method(:"test_search_#{i}") {
        assert_equal(expected, search(nums, target))
      }
    }
  end
end
