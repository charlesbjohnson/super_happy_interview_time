# frozen_string_literal: true

require("config")
require("leetcode/lc_39")

module LeetCode
  class TestLC39 < Minitest::Test
    include(LC39)

    [
      [[[1], 1], [[1]]],
      [[[2], 1], []],
      [[[2, 3, 6, 7], 7], [[7], [2, 2, 3]]],
      [[[2, 3, 5], 8], [[2, 2, 2, 2], [2, 3, 3], [3, 5]]]
    ].each.with_index { |((candidates, target), expected), i|
      define_method(:"test_combination_sum_#{i}") {
        assert_equal(expected.sort, combination_sum(candidates, target).sort)
      }
    }
  end
end
