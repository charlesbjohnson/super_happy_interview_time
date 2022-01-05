# frozen_string_literal: true

require("config")
require("leetcode/lc_841")

module LeetCode
  class TestLC841 < Minitest::Test
    include(LC841)

    [
      [[[]], true],
      [[[1], [2], [3], []], true],
      [[[1, 3], [3, 0, 1], [2], [0]], false]
    ].each.with_index { |(rooms, expected), i|
      define_method(:"test_can_visit_all_rooms_#{i}") {
        assert_equal(expected, can_visit_all_rooms(rooms))
      }
    }
  end
end
