# frozen_string_literal: true

require("config")
require("leetcode/lc_485")

module LeetCode
  class TestLC485 < Minitest::Test
    include(LC485)

    [
      [[], 0],
      [[1], 1],
      [[1, 0, 1], 1],
      [[1, 1, 0, 1, 1, 1], 3],
      [[1, 0, 1, 1, 0, 1], 2]
    ].each.with_index { |(nums, expected), i|
      define_method(:"test_find_max_consecutive_ones_#{i}") {
        assert_equal(expected, find_max_consecutive_ones(nums))
      }
    }
  end
end
