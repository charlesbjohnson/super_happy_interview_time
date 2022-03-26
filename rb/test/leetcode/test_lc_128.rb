# frozen_string_literal: true

require("config")
require("leetcode/lc_128")

module LeetCode
  class TestLC128 < Minitest::Test
    include(LC128)

    [
      [[], 0],
      [[1], 1],
      [[1, 2], 2],
      [[1, 3], 1],
      [[100, 4, 200, 1, 3, 2], 4],
      [[0, 3, 7, 2, 5, 8, 4, 6, 0, 1], 9]
    ].each.with_index { |(nums, expected), i|
      define_method(:"test_longest_consecutive_#{i}") {
        assert_equal(expected, longest_consecutive(nums))
      }
    }
  end
end
