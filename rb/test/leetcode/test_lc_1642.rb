# frozen_string_literal: true

require("config")
require("helpers/leetcode/heap")

require("leetcode/lc_1642")

module LeetCode
  class TestLC1642 < Minitest::Test
    include(LC1642)

    [
      [[[14, 3, 19, 3], 17, 0], 3],
      [[[4, 2, 7, 6, 9, 14, 12], 5, 1], 4],
      [[[4, 12, 2, 7, 3, 18, 20, 3, 19], 10, 2], 7]
    ].each.with_index { |((heights, bricks, ladders), expected), i|
      define_method(:"test_furthest_building_#{i}") {
        assert_equal(expected, furthest_building(heights, bricks, ladders))
      }
    }
  end
end
