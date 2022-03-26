# frozen_string_literal: true

require("config")
require("leetcode/lc_435")

module LeetCode
  class TestLC435 < Minitest::Test
    include(LC435)

    [
      [[[1, 2], [2, 3]], 0],
      [[[1, 2], [1, 2], [1, 2]], 2],
      [[[1, 2], [2, 3], [3, 4], [1, 3]], 1],
      [[[0, 2], [1, 3], [2, 4], [3, 5], [4, 6]], 2]
    ].each.with_index { |(intervals, expected), i|
      define_method(:"test_erase_overlap_intervals_#{i}") {
        assert_equal(expected, erase_overlap_intervals(intervals))
      }
    }
  end
end
