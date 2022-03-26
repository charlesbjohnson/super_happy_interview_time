# frozen_string_literal: true

require("config")
require("leetcode/lc_40")

module LeetCode
  class TestLC40 < Minitest::Test
    include(LC40)

    [
      [[[1], 1], [[1]]],
      [[[2], 1], []],
      [[[2, 3, 6, 7], 7], [[7]]],
      [[[2, 3, 5], 8], [[3, 5]]],
      [[[2, 5, 2, 1, 2], 5], [[1, 2, 2], [5]]],
      [[[10, 1, 2, 7, 6, 1, 5], 8], [[1, 1, 6], [1, 2, 5], [1, 7], [2, 6]]]
    ].each.with_index { |((candidates, target), expected), i|
      define_method(:"test_combination_sum2_#{i}") {
        assert_equal(expected.sort, combination_sum2(candidates, target).sort)
      }
    }
  end
end
