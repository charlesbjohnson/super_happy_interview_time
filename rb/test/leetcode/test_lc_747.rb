# frozen_string_literal: true

require("config")
require("leetcode/lc_747")

module LeetCode
  class TestLC747 < Minitest::Test
    include(LC747)

    [
      [[1], 0],
      [[3, 6, 1, 0], 1],
      [[1, 2, 3, 4], -1]
    ].each.with_index { |(nums, expected), i|
      define_method(:"test_dominant_index_#{i}") {
        assert_equal(expected, dominant_index(nums))
      }
    }
  end
end
