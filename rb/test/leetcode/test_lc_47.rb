# frozen_string_literal: true

require("config")
require("leetcode/lc_47")

module LeetCode
  class TestLC47 < Minitest::Test
    include(LC47)

    [
      [[1], [[1]]],
      [[0, 1], [[0, 1], [1, 0]]],
      [[0, 1, 2], [[0, 1, 2], [0, 2, 1], [1, 0, 2], [1, 2, 0], [2, 0, 1], [2, 1, 0]]],
      [[1, 1, 2], [[1, 1, 2], [1, 2, 1], [2, 1, 1]]]
    ].each.with_index { |(nums, expected), i|
      define_method(:"test_permute_unique_#{i}") {
        assert_equal(expected.sort, permute_unique(nums).sort)
      }
    }
  end
end
