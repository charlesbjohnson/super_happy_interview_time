# frozen_string_literal: true

require("config")
require("leetcode/lc_1770")

module LeetCode
  class TestLC1770 < Minitest::Test
    include(LC1770)

    [
      [[[1], [1]], 1],
      [[[1, 2], [1]], 2],
      [[[1, 2], [1, 2]], 5],
      [[[1, 2, 3], [3, 2, 1]], 14],
      [[[-5, -3, -3, -2, 7, 1], [-10, -5, 3, 4, 6]], 102]
    ].each.with_index { |((nums, multipliers), expected), i|
      define_method(:"test_maximum_score_#{i}") {
        assert_equal(expected, maximum_score(nums, multipliers))
      }
    }
  end
end
