# frozen_string_literal: true

require("config")
require("leetcode/lc_410")

module LeetCode
  class TestLC410 < Minitest::Test
    include(LC410)

    [
      [[[1], 1], 1],
      [[[1, 2, 3], 2], 3],
      [[[1, 4, 4], 3], 4],
      [[[1, 2, 3, 4, 5], 2], 9],
      [[[1, 2, 3, 4, 5], 3], 6],
      [[[1, 2, 3, 4, 5], 4], 5],
      [[[7, 2, 5, 10, 8], 2], 18]
    ].each.with_index { |((nums, m), expected), i|
      define_method(:"test_split_array_#{i}") {
        assert_equal(expected, split_array(nums, m))
      }
    }
  end
end
