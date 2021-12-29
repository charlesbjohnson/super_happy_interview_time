# frozen_string_literal: true

require("config")
require("leetcode/lc_1089")

module LeetCode
  class TestLC1089 < Minitest::Test
    include(LC1089)

    [
      [[], []],
      [[0], [0]],
      [[1], [1]],
      [[1, 0], [1, 0]],
      [[0, 1], [0, 0]],
      [[0, 1], [0, 0]],
      [[1, 0, 2, 3, 0, 4, 5, 0], [1, 0, 0, 2, 3, 0, 0, 4]]
    ].each.with_index { |(arr, expected), i|
      define_method(:"test_duplicate_zeros_#{i}") {
        assert_equal(expected, duplicate_zeros(arr))
      }
    }
  end
end
