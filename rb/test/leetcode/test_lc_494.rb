# typed: false
# frozen_string_literal: true

require("config")
require("leetcode/lc_494")

module LeetCode
  class TestLC494 < Minitest::Test
    include(LC494)

    [
      [[1], 0, 0],
      [[1], 1, 1],
      [[1], -1, 1],
      [[1, 2], 3, 1],
      [[1, 2, 1], 0, 2],
      [[1, 1, 1, 1, 1], 3, 5],
      [[6, 44, 30, 25, 8, 26, 34, 22, 10, 18, 34, 8, 0, 32, 13, 48, 29, 41, 16, 30], 12, 6692]
    ].each.with_index { |(list, sum, expected), i|
      define_method(:"test_find_target_sum_ways_#{i}") {
        assert_equal(expected, find_target_sum_ways(list, sum))
      }
    }
  end
end
