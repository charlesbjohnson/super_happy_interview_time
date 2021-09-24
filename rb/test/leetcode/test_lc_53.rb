# typed: false
# frozen_string_literal: true

require("config")
require("leetcode/lc_53")

module LeetCode
  class TestLC53 < Minitest::Test
    include(LC53)

    [
      [[], -2_147_483_648],
      [[-1], -1],
      [[1], 1],
      [[0, 1], 1],
      [[-1, 1], 1],
      [[-1, -2], -1],
      [[-2, -1], -1],
      [[-1, 1, -1, 3], 3],
      [[-2, 1, -3, 4, -1, 2, 1, -5, 4], 6]
    ].each.with_index { |(list, expected), i|
      define_method(:"test_max_sub_array_#{i}") {
        assert_equal(expected, max_sub_array(list))
      }
    }
  end
end
