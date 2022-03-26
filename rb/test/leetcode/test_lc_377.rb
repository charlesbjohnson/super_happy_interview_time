# frozen_string_literal: true

require("config")
require("leetcode/lc_377")

module LeetCode
  class TestLC377 < Minitest::Test
    include(LC377)

    [
      [[[1], 1], 1],
      [[[9], 3], 0],
      [[[1, 2, 3], 4], 7]
    ].each.with_index { |((nums, target), expected), i|
      define_method(:"test_combination_sum4_#{i}") {
        assert_equal(expected, combination_sum4(nums, target))
      }
    }
  end
end
