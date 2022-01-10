# frozen_string_literal: true

require("config")
require("leetcode/lc_724")

module LeetCode
  class TestLC724 < Minitest::Test
    include(LC724)

    [
      [[0], 0],
      [[1, 7, 3, 6, 5, 6], 3],
      [[1, 2, 3], -1],
      [[2, 1, -1], 0]
    ].each.with_index { |(nums, expected), i|
      define_method(:"test_pivot_index_#{i}") {
        assert_equal(expected, pivot_index(nums))
      }
    }
  end
end
