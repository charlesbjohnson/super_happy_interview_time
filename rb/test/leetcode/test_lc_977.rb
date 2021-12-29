# frozen_string_literal: true

require("config")
require("leetcode/lc_977")

module LeetCode
  class TestLC977 < Minitest::Test
    include(LC977)

    [
      [[], []],
      [[1], [1]],
      [[1, 2, 3], [1, 4, 9]],
      [[-3, -2, -1], [1, 4, 9]],
      [[-4, -1, 0, 3, 10], [0, 1, 9, 16, 100]],
      [[-7, -3, 2, 3, 11], [4, 9, 9, 49, 121]]
    ].each.with_index { |(nums, expected), i|
      define_method(:"test_sorted_squares_#{i}") {
        assert_equal(expected, sorted_squares(nums))
      }
    }
  end
end
