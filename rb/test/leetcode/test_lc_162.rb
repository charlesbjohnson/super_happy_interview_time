# frozen_string_literal: true

require("config")
require("leetcode/lc_162")

module LeetCode
  class TestLC162 < Minitest::Test
    include(LC162)

    [
      [[0], 0],
      [[2, 1, 0], 0],
      [[0, 1, 0], 1],
      [[0, 1, 2], 2],
      [[1, 0, 1], 0],
      [[1, 2, 3, 1], 2],
      [[1, 2, 1, 3, 5, 6, 4], 5]
    ].each.with_index { |(nums, expected), i|
      define_method(:"test_find_peak_element_#{i}") {
        assert_equal(expected, find_peak_element(nums))
      }
    }
  end
end
