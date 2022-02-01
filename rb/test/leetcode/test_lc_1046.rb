# frozen_string_literal: true

require("config")
require("helpers/leetcode/heap")

require("leetcode/lc_1046")

module LeetCode
  class TestLC1046 < Minitest::Test
    include(LC1046)

    [
      [[1], 1],
      [[1, 1], 0],
      [[1, 2], 1],
      [[2, 7, 4, 1, 8, 1], 1]
    ].each.with_index { |(stones, expected), i|
      define_method(:"test_last_stone_weight_#{i}") {
        assert_equal(expected, last_stone_weight(stones))
      }
    }
  end
end
