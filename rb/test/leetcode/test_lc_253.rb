# frozen_string_literal: true

require("config")
require("helpers/leetcode/map")

require("leetcode/lc_253")

module LeetCode
  class TestLC253 < Minitest::Test
    include(LC253)

    [
      [[[0, 30], [5, 10], [15, 20]], 2],
      [[[7, 10], [2, 4]], 1]
    ].each.with_index { |(intervals, expected), i|
      define_method(:"test_min_meeting_rooms_#{i}") {
        assert_equal(expected, min_meeting_rooms(intervals))
      }
    }
  end
end
