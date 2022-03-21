# frozen_string_literal: true

require("config")
require("leetcode/lc_252")

module LeetCode
  class TestLC252 < Minitest::Test
    include(LC252)

    [
      [[[0, 30], [5, 10], [15, 20]], false],
      [[[7, 10], [2, 4]], true]
    ].each.with_index { |(intervals, expected), i|
      define_method(:"test_can_attend_meetings_#{i}") {
        assert_equal(expected, can_attend_meetings(intervals))
      }
    }
  end
end
