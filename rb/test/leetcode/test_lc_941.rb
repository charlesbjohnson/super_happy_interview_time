# frozen_string_literal: true

require("config")
require("leetcode/lc_941")

module LeetCode
  class TestLC941 < Minitest::Test
    include(LC941)

    [
      [[], false],
      [[0], false],
      [[0, 1], false],
      [[0, 0, 0], false],
      [[1, 0, 1], false],
      [[1, 2, 3], false],
      [[3, 2, 1], false],
      [[3, 2, 1], false],
      [[0, 1, 0], true],
      [[3, 5, 5], false],
      [[0, 3, 2, 1], true],
      [[5, 4, 3, 2, 1], false]
    ].each.with_index { |(arr, expected), i|
      define_method(:"test_valid_mountain_array_#{i}") {
        assert_equal(expected, valid_mountain_array(arr))
      }
    }
  end
end
