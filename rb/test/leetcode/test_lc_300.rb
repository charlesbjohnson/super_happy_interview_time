# frozen_string_literal: true

require("config")
require("leetcode/lc_300")

module LeetCode
  class TestLC300 < Minitest::Test
    include(LC300)

    [
      [[1], 1],
      [[1, 2], 2],
      [[2, 1], 1],
      [[1, 0, 2], 2],
      [[2, 0, 1], 2],
      [[2, 0, 1], 2],
      [[0, 2, 1], 2],
      [[0, 1, 2], 3],
      [[0, 1, 0], 2],
      [[10, 9, 2, 5, 3, 7, 101, 18], 4],
      [[0, 1, 0, 3, 2, 3], 4],
      [[7, 7, 7, 7, 7, 7, 7], 1]
    ].each.with_index { |(nums, expected), i|
      define_method(:"test_length_of_lis_#{i}") {
        assert_equal(expected, length_of_lis(nums))
      }
    }
  end
end
