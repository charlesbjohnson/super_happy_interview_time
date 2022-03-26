# frozen_string_literal: true

require("config")
require("leetcode/lc_81")

module LeetCode
  class TestLC81 < Minitest::Test
    include(LC81)

    [
      [[[0], 0], true],
      [[[0], 1], false],
      [[[0, 1, 2], 0], true],
      [[[0, 1, 2], 1], true],
      [[[0, 1, 2], 2], true],
      [[[2, 0, 1], 0], true],
      [[[2, 0, 1], 1], true],
      [[[2, 0, 1], 2], true],
      [[[1, 2, 0], 0], true],
      [[[1, 2, 0], 1], true],
      [[[1, 2, 0], 2], true],
      [[[1, 2, 0], -1], false],
      [[[5, 1, 2, 3, 4], 5], true],
      [[[4, 5, 1, 2, 3], 5], true],
      [[[3, 4, 5, 1, 2], 5], true],
      [[[2, 3, 4, 5, 1], 5], true],
      [[[1, 2, 3, 4, 5], 5], true],
      [[[4, 5, 6, 7, 0, 1, 2], 0], true],
      [[[4, 5, 6, 7, 0, 1, 2], 3], false]
    ].each.with_index { |((nums, target), expected), i|
      define_method(:"test_search_#{i}") {
        assert_equal(expected, search(nums, target))
      }
    }
  end
end
