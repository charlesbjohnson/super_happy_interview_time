# frozen_string_literal: true

require("config")
require("helpers/leetcode/map")

require("leetcode/lc_56")

module LeetCode
  class TestLC56 < Minitest::Test
    include(LC56)

    [
      [[[1, 10]], [[1, 10]]],
      [[[1, 4], [4, 5]], [[1, 5]]],
      [[[1, 4], [5, 8]], [[1, 4], [5, 8]]],
      [[[1, 3], [2, 6], [8, 10], [15, 18]], [[1, 6], [8, 10], [15, 18]]]
    ].each.with_index { |(intervals, expected), i|
      define_method(:"test_merge_#{i}") {
        assert_equal(expected, merge(intervals))
      }
    }
  end
end
