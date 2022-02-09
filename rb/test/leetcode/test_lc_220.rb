# frozen_string_literal: true

require("config")
require("leetcode/lc_220")

module LeetCode
  class TestLC220 < Minitest::Test
    include(LC220)

    [
      [[[1, 2, 3, 1], 3, 0], true],
      [[[1, 0, 1, 1], 1, 2], true],
      [[[1, 5, 9, 1, 5, 9], 2, 3], false]
    ].each.with_index { |((nums, k, t), expected), i|
      define_method(:"test_contains_nearby_almost_duplicate_#{i}") {
        assert_equal(expected, contains_nearby_almost_duplicate(nums, k, t))
      }
    }
  end
end
