# frozen_string_literal: true

require("config")
require("leetcode/lc_35")

module LeetCode
  class TestLC35 < Minitest::Test
    include(LC35)

    [
      [[], 1, 0],
      [[0], 1, 1],
      [[1], 0, 0],
      [[1, 3, 5, 6], 5, 2],
      [[1, 3, 5, 6], 2, 1],
      [[1, 3, 5, 6], 7, 4],
      [[1, 3, 5, 6], 0, 0]
    ].each.with_index { |(nums, target, expected), i|
      define_method(:"test_search_insert_#{i}") {
        assert_equal(expected, search_insert(nums, target))
      }
    }
  end
end
