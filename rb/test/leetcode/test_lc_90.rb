# frozen_string_literal: true

require("config")
require("leetcode/lc_90")

module LeetCode
  class TestLC90 < Minitest::Test
    include(LC90)

    [
      [[0], [[], [0]]],
      [[0, 1], [[], [0], [1], [0, 1]]],
      [[0, 1, 2], [[], [0], [1], [2], [0, 1], [0, 2], [1, 2], [0, 1, 2]]],
      [[0, 1, 1], [[], [0], [1], [0, 1], [1, 1], [0, 1, 1]]]
    ].each.with_index { |(nums, expected), i|
      define_method(:"test_subsets_with_dup_#{i}") {
        assert_equal(expected.sort, subsets_with_dup(nums).sort)
      }
    }
  end
end
