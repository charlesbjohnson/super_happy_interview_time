# frozen_string_literal: true

require("config")
require("leetcode/lc_154")

module LeetCode
  class TestLC154 < Minitest::Test
    include(LC154)

    [
      [[1], 1],
      [[1, 2, 3], 1],
      [[3, 2, 1], 1],
      [[2, 3, 1], 1],
      [[0, 2, 2, 2], 0],
      [[2, 0, 2, 2], 0],
      [[2, 2, 0, 2], 0],
      [[2, 2, 2, 0], 0]
    ].each.with_index { |(nums, expected), i|
      define_method(:"test_find_min_#{i}") {
        assert_equal(expected, find_min(nums))
      }
    }
  end
end
