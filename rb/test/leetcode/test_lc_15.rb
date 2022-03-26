# frozen_string_literal: true

require("config")
require("leetcode/lc_15")

module LeetCode
  class TestLC15 < Minitest::Test
    include(LC15)

    [
      [[], []],
      [[0], []],
      [[0, 0, 0, 0], [[0, 0, 0]]],
      [[-1, 0, 1, 2, -1, -4], [[-1, -1, 2], [-1, 0, 1]]],
      [[-1, 0, 1, 2, -1, -4, -2, -3, 3, 0, 4], [[-4, 0, 4], [-4, 1, 3], [-3, -1, 4], [-3, 0, 3], [-3, 1, 2], [-2, -1, 3], [-2, 0, 2], [-1, -1, 2], [-1, 0, 1]]]
    ].each.with_index { |(nums, expected), i|
      define_method(:"test_three_sum_#{i}") {
        assert_equal(expected, three_sum(nums))
      }
    }
  end
end
