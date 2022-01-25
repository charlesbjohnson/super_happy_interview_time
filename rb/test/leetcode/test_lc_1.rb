# frozen_string_literal: true

require("config")
require("leetcode/lc_1")

module LeetCode
  class TestLC1 < Minitest::Test
    include(LC1)

    [
      [[[0, 1], 1], [0, 1]],
      [[[1, 1], 2], [0, 1]],
      [[[0, 1, 2], 2], [0, 2]],
      [[[0, 1, 2], 3], [1, 2]],
      [[[3, 2, 4], 6], [1, 2]],
      [[[2, 7, 11, 15], 9], [0, 1]]
    ].each.with_index { |((nums, target), expected), i|
      define_method(:"test_two_sum_#{i}") {
        assert_equal(expected, two_sum(nums, target))
      }
    }
  end
end
